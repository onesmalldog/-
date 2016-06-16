//
//  LGGetWifiInfo.h
//  textObject
//
//  Created by 东途 on 16/5/9.
//  Copyright © 2016年 东途. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGGetWifiInfo : NSObject

//获取Wi-Fi信息，有BSSID,SSID,SSIDDATA三项，只能真机测试时候正常使用
+ (NSString *)getWifiName;

@end
