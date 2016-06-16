//
//  DTRootTool.m
//  DTEN
//
//  Created by 东途 on 16/6/14.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import "DTRootTool.h"

#import "DTGetUser.h"

#import "DTMainTabBarController.h"
#import "DTSignInController.h"
#import "DTNavController.h"

@implementation DTRootTool

+ (UIViewController *)chooseRootViewController:(UIWindow *)window {
    
    NSArray *array = [DTGetUser getUser];
    
    if (array.count > 0) {
        
        DTMainTabBarController *tabBar = [DTMainTabBarController sharedTabBar];
        
        window.rootViewController = tabBar;
        
        return tabBar;
        
    } else {
        
        DTSignInController *signIn = [[DTSignInController alloc]init];
        DTNavController *nav = [[DTNavController alloc]initWithRootViewController:signIn];
        window.rootViewController = nav;
        return nav;
    }
    
}

@end
