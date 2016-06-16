//
//  UIBarButtonItem+Extention.m
//  微博二期
//
//  Created by MS on 15-12-23.
//  Copyright (c) 2015年 LG. All rights reserved.
//

#import "UIBarButtonItem+Extention.h"
#import "UIView+Extention.h"

@implementation UIBarButtonItem (Extention)

/**创建自定义按钮样式*/
+ (UIBarButtonItem *)itemWithTarget:(id)target Action:(SEL)action image:(NSString *)image highlightImage:(NSString *)highlightImage
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
//    [btn setBackgroundImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    //设置尺寸
//    btn.size = btn.currentBackgroundImage.size;
    btn.size = CGSizeMake(25, 22);
    btn.imageEdgeInsets = UIEdgeInsetsMake(-5, 0, 0, 0);
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

@end
