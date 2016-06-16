//
//  UIButton+Square.m
//  DTEN
//
//  Created by 东途 on 16/6/12.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import "UIButton+Square.h"

@implementation UIButton (Square)

+ (UIButton *)btnWithSquareBtnImage:(NSString *)image hlImage:(NSString *)hlImage bgImage:(NSString *)bgImage bgHlImage:(NSString *)bgHlImage title:(NSString *)title {
    
    UIColor *color = [UIColor colorWithRed:70/255.0 green:101/255.0 blue:76/255.0 alpha:1];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:bgImage] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:bgHlImage] forState:UIControlStateHighlighted];
    
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:hlImage] forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    return btn;
}

@end
