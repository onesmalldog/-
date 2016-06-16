//
//  LGGetWifiInfo.m
//  textObject
//
//  Created by 东途 on 16/5/9.
//  Copyright © 2016年 东途. All rights reserved.
//

#import "LGGetWifiInfo.h"

#import <SystemConfiguration/CaptiveNetwork.h>

@implementation LGGetWifiInfo


//获取Wi-Fi信息，有BSSID,SSID,SSIDDATA三项，只能真机测试时候正常使用
+ (NSString *)getWifiName {
    
    NSString *wifiName = nil;
    
    CFArrayRef wifiInterfaces = CNCopySupportedInterfaces();
    
    if (!wifiInterfaces) {
        return nil;
    }
    
    NSArray *interfaces = (__bridge NSArray *)wifiInterfaces;
    
    for (NSString *interfaceName in interfaces) {
        
        CFDictionaryRef dictRef = CNCopyCurrentNetworkInfo((__bridge CFStringRef)(interfaceName));
        
        if (dictRef) {
            
            // Wi-Fi的详细信息
            NSDictionary *networkInfo = (__bridge NSDictionary *)dictRef;
            
//            NSLog(@"network info -> %@", networkInfo);
            
            wifiName = [networkInfo objectForKey:(__bridge NSString *)kCNNetworkInfoKeySSID];
            
            CFRelease(dictRef);
        }
    }
    
    CFRelease(wifiInterfaces);
    
    return wifiName;
}

@end
