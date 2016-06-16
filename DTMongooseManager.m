//
//  DTMongooseManager.m
//  DTEN
//
//  Created by 东途 on 16/6/15.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import "DTMongooseManager.h"

#import "MongooseDaemon.h"

@interface DTMongooseManager()

//@property (strong, nonatomic) MongooseDaemon *mongoose;

@end

@implementation DTMongooseManager

+ (instancetype)sharedManager {
    
    static DTMongooseManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[DTMongooseManager alloc]init];
        
    });
    return manager;
}

+ (MongooseDaemon *)sharedMongoose {
    
    static MongooseDaemon *mongoose = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mongoose = [[MongooseDaemon alloc]init];
    });
    
    return mongoose;
}

+ (void)startMongoose {
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [[self sharedMongoose] startMongooseDaemon:@"8080"];
        
        // 发送通知
        NSNotification *noti = [NSNotification notificationWithName:MongooseIsOn object:nil userInfo:@{ @"mongoose" : @"1" }];
        [[NSNotificationCenter defaultCenter] postNotification:noti];
        
    });
}

+ (void)stopMongoose {
    
    [[self sharedMongoose] stopMongooseDaemon];
    
    // 发送通知
    NSNotification *noti = [NSNotification notificationWithName:MongooseIsOn object:nil userInfo:@{ @"mongoose" : @"0" }];
    [[NSNotificationCenter defaultCenter] postNotification:noti];
    
}

@end
