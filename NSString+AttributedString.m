//
//  NSString+AttributedString.m
//  DTEN
//
//  Created by 东途 on 16/6/13.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import "NSString+AttributedString.h"

#import <CoreText/CoreText.h>

@implementation NSString (AttributedString)

+ (NSMutableAttributedString *)attributedString:(NSString *)str fontSize:(int)fontSize color:(UIColor *)color underLine:(NSNumber *)underline {
    
    NSRange range = NSMakeRange(0, str.length);
    
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:str];
    
    [AttributedStr addAttribute:NSFontAttributeName
     
                          value:[UIFont systemFontOfSize:fontSize]
     
                          range:range];
    
    [AttributedStr addAttribute:NSForegroundColorAttributeName
     
                          value:color
     
                          range:range];
    if (underline > 0) {
        
        //    NSUnderlineStyleSingle
        [AttributedStr addAttribute:NSUnderlineStyleAttributeName value:underline range:range];
    }
    
    return AttributedStr;
}

@end
