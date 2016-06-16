//
//  UIFont+Family.m
//  DTEN
//
//  Created by 东途 on 16/6/6.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import "UIFont+Family.h"

@implementation UIFont (Family)


+ (UIFont *)labelFontWithMediumFontSize:(CGFloat)size {
    UIFontDescriptor *attribute = [UIFontDescriptor fontDescriptorWithFontAttributes:@{
                                                                                       
        UIFontDescriptorFamilyAttribute : @"HelveticaNeue",
        UIFontDescriptorNameAttribute : @"HelveticaNeue-Medium"
                                                                                       
        }];
    
    return [UIFont fontWithDescriptor:attribute size:size];
}

+ (UIFont *)labelFontWithFontSize:(CGFloat)size {
    UIFontDescriptor *attribute = [UIFontDescriptor fontDescriptorWithFontAttributes:@{
                                                                                       
        UIFontDescriptorFamilyAttribute : @"HelveticaNeue"
                                                                                       
        }];
    
    return [UIFont fontWithDescriptor:attribute size:size];
}

@end
