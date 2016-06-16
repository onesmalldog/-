//
//  DTGetUser.m
//  DTEN
//
//  Created by 东途 on 16/6/14.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import "DTGetUser.h"

#import "ACSimpleKeychain.h"

@implementation DTGetUser

+ (NSArray *)getUser {
    
    ACSimpleKeychain *keychain = [ACSimpleKeychain defaultKeychain];
    return [keychain allCredentialsForService:KeyChainService limit:99];
}

@end
