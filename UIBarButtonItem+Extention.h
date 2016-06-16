//
//  UIBarButtonItem+Extention.h
//  微博二期
//
//  Created by MS on 15-12-23.
//  Copyright (c) 2015年 LG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extention)

+ (UIBarButtonItem *)itemWithTarget:(id)target Action:(SEL)action image:(NSString *)image highlightImage:(NSString *)highlightImage;

@end
