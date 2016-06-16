//
//  DTImageManager.m
//  DTEN
//
//  Created by 东途 on 16/6/16.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import "DTImageManager.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface DTImageManager() {
    
    PHAsset *_phAsset;
    
}

@property (strong, nonatomic) UIImage *originImage;

@end

@implementation DTImageManager

+ (PHCachingImageManager *)sharedManager {
    
    static PHCachingImageManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[PHCachingImageManager alloc]init];
    });
    return manager;
}

- (UIImage *)originImage {
    if (_originImage) {
        return _originImage;
    }
    __block UIImage *resultImage;
    PHImageRequestOptions *phImageRequestOptions = [[PHImageRequestOptions alloc] init];
    phImageRequestOptions.synchronous = YES;
    
    [[DTImageManager sharedManager] requestImageForAsset:_phAsset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeDefault options:phImageRequestOptions resultHandler:^(UIImage *result, NSDictionary *info) {
        
        resultImage = result;
    }];
    
    _originImage = resultImage;
    return resultImage;
}

- (NSInteger)requestOriginImageWithCompletion:(void (^)(UIImage *, NSDictionary *))completion withProgressHandler:(PHAssetImageProgressHandler)phProgressHandler {
    
    if (_originImage) {
        // 如果已经有缓存的图片则直接拿缓存的图片
        if (completion) {
            completion(_originImage, nil);
        }
        return 0;
    } else {
        PHImageRequestOptions *imageRequestOptions = [[PHImageRequestOptions alloc] init];
        imageRequestOptions.networkAccessAllowed = YES; // 允许访问网络
        imageRequestOptions.progressHandler = phProgressHandler;
        return [[DTImageManager sharedManager] requestImageForAsset:_phAsset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeDefault options:imageRequestOptions resultHandler:^(UIImage *result, NSDictionary *info) {
            // 排除取消，错误，低清图三种情况，即已经获取到了高清图时，把这张高清图缓存到 _originImage 中
            BOOL downloadFinined = ![[info objectForKey:PHImageCancelledKey] boolValue] && ![info objectForKey:PHImageErrorKey] && ![[info objectForKey:PHImageResultIsDegradedKey] boolValue];
            if (downloadFinined) {
                _originImage = result;
            }
            if (completion) {
                completion(result, info);
            }
        }];
    }
    
}

@end
