//
//  UITextField+SignInField.m
//  DTEN
//
//  Created by 东途 on 16/6/13.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import "UITextField+SignInField.h"

@implementation UITextField (SignInField)

+ (UITextField *)textFieldInBackground:(UIView *)view {
    
    UITextField *textField = [[UITextField alloc]init];
    textField.secureTextEntry = NO;
    textField.clearsOnBeginEditing = NO;
    
    textField.textAlignment = NSTextAlignmentLeft;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    textField.adjustsFontSizeToFitWidth = YES;
    
    textField.returnKeyType = UIReturnKeyNext;
    
    textField.font = [UIFont systemFontOfSize:17];
    textField.textColor = [UIColor blackColor];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    textField.borderStyle = UITextBorderStyleNone;
    textField.backgroundColor = [UIColor clearColor];
    
    [view addSubview:textField];
    
    return textField;
}

@end
