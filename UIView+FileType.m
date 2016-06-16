//
//  UIView+FileType.m
//  DTEN
//
//  Created by 东途 on 16/6/1.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import "UIView+FileType.h"

@implementation UIView (FileType)

// 判断格式
- (NSString *)judgeType:(NSString *)type {
    
    if ([type caseInsensitiveCompare:@"JPG"] == NSOrderedSame) {
        
        return @"IMAGE";
    } else if ([type caseInsensitiveCompare:@"PNG"] == NSOrderedSame) {
        
        return @"IMAGE";
    } else if ([type caseInsensitiveCompare:@"JPEG"] == NSOrderedSame) {
        
        return @"IMAGE";
    } else if ([type caseInsensitiveCompare:@"ICO"] == NSOrderedSame) {
        
        return @"IMAGE";
    } else if ([type caseInsensitiveCompare:@"BMP"] == NSOrderedSame) {
        
        return @"IMAGE";
    } else if ([type caseInsensitiveCompare:@"GIF"] == NSOrderedSame) {
        
        return @"IMAGE";
    } else if ([type caseInsensitiveCompare:@"TIF"] == NSOrderedSame) {
        
        return @"IMAGE";
    } else if ([type caseInsensitiveCompare:@"PCX"] == NSOrderedSame) {
        
        return @"IMAGE";
    } else if ([type caseInsensitiveCompare:@"TGA"] == NSOrderedSame) {
        
        return @"IMAGE";
    } else if ([type caseInsensitiveCompare:@"MP4"] == NSOrderedSame) {
        
        return @"VIDEO";
    } else if ([type caseInsensitiveCompare:@"AVI"] == NSOrderedSame) {
        
        return @"VIDEO";
    } else if ([type caseInsensitiveCompare:@"3GP"] == NSOrderedSame) {
        
        return @"VIDEO";
    } else if ([type caseInsensitiveCompare:@"RMVB"] == NSOrderedSame) {
        
        return @"VIDEO";
    } else if ([type caseInsensitiveCompare:@"WAV"] == NSOrderedSame) {
        
        return @"VIDEO";
    } else if ([type caseInsensitiveCompare:@"MPG"] == NSOrderedSame) {
        
        return @"VIDEO";
    } else if ([type caseInsensitiveCompare:@"MKV"] == NSOrderedSame) {
        
        return @"VIDEO";
    } else if ([type caseInsensitiveCompare:@"VOB"] == NSOrderedSame) {
        
        return @"VIDEO";
    } else if ([type caseInsensitiveCompare:@"FLV"] == NSOrderedSame) {
        
        return @"VIDEO";
    } else if ([type caseInsensitiveCompare:@"SWF"] == NSOrderedSame) {
        
        return @"VIDEO";
    } else if ([type caseInsensitiveCompare:@"MOV"] == NSOrderedSame) {
        
        return @"VIDEO";
    } else if ([type caseInsensitiveCompare:@"PDF"] == NSOrderedSame) {
        
        return @"FILE";
    } else if ([type caseInsensitiveCompare:@"DOC"] == NSOrderedSame) {
        
        return @"FILE";
    } else if ([type caseInsensitiveCompare:@"DOCX"] == NSOrderedSame) {
        
        return @"FILE";
    } else if ([type caseInsensitiveCompare:@"PPT"] == NSOrderedSame) {
        
        return @"FILE";
    } else if ([type caseInsensitiveCompare:@"PPTX"] == NSOrderedSame) {
        
        return @"FILE";
    } else if ([type caseInsensitiveCompare:@"XLS"] == NSOrderedSame) {
        
        return @"FILE";
    } else if ([type caseInsensitiveCompare:@"XLSX"] == NSOrderedSame) {
        
        return @"FILE";
    } else {
        
        return @"UNKNOW";
    }
    
}
@end
