//
//  DTGetFile.h
//  DTEN
//
//  Created by 东途 on 16/6/15.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import <Foundation/Foundation.h>


// caches路径  //NSDocumentDirectory,NSCachesDirectory
#define KCachesPath   \
[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

@interface DTGetFile : NSObject

// 获取所有文件
+ (NSArray *)getAllFiles;

// 获取文件名
+ (NSString *)getFileNameWithPath:(NSString *)path;

// 获取类型
+ (NSString *)getTypeWithName:(NSString *)name;

// 获取文件时间
+ (NSDate *)getFileTimeWithPath:(NSString *)path;

// 获取文件大小
+ (NSString *)getFileSizeWithPath:(NSString *)path;

@end
