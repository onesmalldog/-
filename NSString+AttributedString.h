//
//  NSString+AttributedString.h
//  DTEN
//
//  Created by 东途 on 16/6/13.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface NSString (AttributedString)

+ (NSMutableAttributedString *)attributedString:(NSString *)str fontSize:(int)fontSize color:(UIColor *)color underLine:(NSNumber *)underline;

@end
