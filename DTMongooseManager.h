//
//  DTMongooseManager.h
//  DTEN
//
//  Created by 东途 on 16/6/15.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MongooseIsOn @"MongooseIsOn"

@interface DTMongooseManager : NSObject

+ (instancetype)sharedManager;

+ (void)startMongoose;

+ (void)stopMongoose;

@end
