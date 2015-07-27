//
//  SR_UserInfoDetail.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/17.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "SR_UserInfoDetail.h"

@implementation SR_UserInfoDetail

+ (void)setLoginMark {
    [[NSUserDefaults standardUserDefaults] setValue:@"login" forKey:@"LOGIN"];
}

+ (BOOL)getLoginMark {
    NSString *needLogin = [[NSUserDefaults standardUserDefaults] valueForKey:@"LOGIN"];
    if (needLogin == nil) {
        return YES;
    }
    else {
        return NO;
    }
}

+ (void)loginOut {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"LOGIN"];
}

@end
