//
//  UILabel+SignInLabel.m
//  DTEN
//
//  Created by 东途 on 16/6/12.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import "UILabel+SignInLabel.h"

@implementation UILabel (SignInLabel)

+ (UILabel *)labelWithSignInLabel {
    
    UILabel *label = [[UILabel alloc]init];
    
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    return label;
}

@end
