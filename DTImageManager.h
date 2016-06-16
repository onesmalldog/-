//
//  DTImageManager.h
//  DTEN
//
//  Created by 东途 on 16/6/16.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@interface DTImageManager : NSObject

/// Asset 的原图（包含系统相册“编辑”功能处理后的效果）
- (UIImage *)originImage;

/**
 *  异步请求 Asset 的原图，包含了系统照片“编辑”功能处理后的效果（剪裁，旋转和滤镜等），可能会有网络请求
 *
 *  @param completion        完成请求后调用的 block，参数中包含了请求的原图以及图片信息，在 iOS 8.0 或以上版本中，
 *                           这个 block 会被多次调用，其中第一次调用获取到的尺寸很小的低清图，然后不断调用，直接获取到高清图，
 *                           获取到高清图后 QMUIAsset 会缓存起这张高清图，这时 block 中的第二个参数（图片信息）返回的为 nil。
 *  @param phProgressHandler 处理请求进度的 handler，不在主线程上执行，在 block 中修改 UI 时注意需要手工放到主线程处理。
 *
 *  @wraning iOS 8.0 以下中并没有异步请求预览图的接口，因此实际上为同步请求，这时 block 中的第二个参数（图片信息）返回的为 nil。
 *
 *  @return 返回请求图片的请求 id
 */
- (NSInteger)requestOriginImageWithCompletion:(void (^)(UIImage *, NSDictionary *))completion withProgressHandler:(PHAssetImageProgressHandler)phProgressHandler;


@end
