//
//  UIViewController+JudgeWifiSSID.m
//  DTEN
//
//  Created by 东途 on 16/6/8.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import "UIViewController+JudgeWifiSSID.h"
#import "LGGetWifiInfo.h"

@implementation UIViewController (JudgeWifiSSID)

// 判断wifi的类型“开头”
- (BOOL)judgeWifiSSID {
    
    NSString *ssid = [LGGetWifiInfo getWifiName];
    
    NSString *lowerSSID = [ssid lowercaseString];
    
    if ([lowerSSID hasPrefix:@"ap-"]) {
        return YES;
    }
    else if ([lowerSSID hasPrefix:@"dten-"]) {
        return YES;
    }
    else return NO;
    
}

@end
