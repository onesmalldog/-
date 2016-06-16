//
//  DTGetFile.m
//  DTEN
//
//  Created by 东途 on 16/6/15.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import "DTGetFile.h"
#import "NSObject+FileType.h"

// 照片原图路径
#define KOriginalPhotoImagePath   \
[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"OriginalPhotoImages"]

// 视频URL路径
#define KVideoUrlPath   \
[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"VideoURL"]

@implementation DTGetFile

+ (NSArray *)getAllFiles {
    
    NSMutableArray* array = [NSMutableArray array];
    
    NSFileManager* fileMgr = [NSFileManager defaultManager];
    
    NSArray* tempArray = [fileMgr contentsOfDirectoryAtPath:KCachesPath error:nil];
    
    for (NSString* fileName in tempArray) {
        
        BOOL flag = YES;
        
        NSString* fullPath = [KCachesPath stringByAppendingPathComponent:fileName];
        
        
        if ([[self judgeType:[fullPath pathExtension]] isEqualToString:@"UNKNOW"]) {
            
            continue;
        }
        
        if ([fileMgr fileExistsAtPath:fullPath isDirectory:&flag]) {
            
            if (!flag) {
                
                [array addObject:fullPath];
            }
        }
    }
    
    return array;
}

+ (NSString *)getFileNameWithPath:(NSString *)path {
    
    return [path lastPathComponent];
}
+ (NSString *)getTypeWithName:(NSString *)name {
    
    return [name pathExtension];
}

// 获取文件时间
+ (NSDate *)getFileTimeWithPath:(NSString *)path {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error;
    NSDictionary *info = [fileManager attributesOfItemAtPath:path error:&error];
    
    return [info objectForKey:NSFileCreationDate];
    
}
// 获取文件大小
+ (NSString *)getFileSizeWithPath:(NSString *)path {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error;
    NSDictionary *info = [fileManager attributesOfItemAtPath:path error:&error];
    
    NSString *sizeStr = [info objectForKey:NSFileSize];
    
    double size = [sizeStr doubleValue];
    
    double kb = size / 1024;
    
    double mb = size / (1024 * 1024);
    
    NSString *str;
    
    if (mb < 1) {
        
        str = [NSString stringWithFormat:@"%.2f KB", kb];
    }
    else {
        
        str = [NSString stringWithFormat:@"%.2f MB", mb];
    }
    
    size = [str doubleValue];
    
    return str;
}


// *********** 备用 **********

// 截取文件类型
//- (NSString *)operationType:(NSString *)name {
//    
//    //    NSRange range = [name rangeOfString:@"."];
//    //
//    //    if (range.location != NSNotFound) {
//    //
//    //        //得到字符串的位置和长度
//    //        long index = range.location + range.length;
//    //
//    //        //抽取指定范围的字符串
//    //        NSString *type = [name substringWithRange:NSMakeRange(index, name.length - index)];
//    //
//    //        return type;
//    //
//    //    }
//    //    else {
//    //        return nil;
//    //    }
//    
//    return [name pathExtension];
//}

// 截取文件名字
//- (NSString *)operationName:(NSString *)str {
//    
//    //    //检索字符串
//    //    NSRange range;
//    //
//    //    range=[str rangeOfString:@"Documents/"];
//    //
//    //    if (range.location != NSNotFound) {
//    //
//    //        //得到字符串的位置和长度
//    //        long index = range.location + range.length;
//    //
//    //        //抽取指定范围的字符串
//    //        return [str substringWithRange:NSMakeRange(index, str.length - index)];
//    //    }
//    //    else {
//    //        return nil;
//    //    }
//    
//    return [str lastPathComponent];
//    
//}

@end
