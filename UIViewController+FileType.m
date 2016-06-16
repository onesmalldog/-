//
//  UIViewController+FileType.m
//  DTEN
//
//  Created by 东途 on 16/6/1.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import "UIViewController+FileType.h"
#import "UIView+FileType.h"

@implementation UIViewController (FileType)


// 判断格式
- (NSString *)judgeType:(NSString *)type {
    
    return [self.view judgeType:type];
}

@end
