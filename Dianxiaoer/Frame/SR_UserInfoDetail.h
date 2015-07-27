//
//  SR_UserInfoDetail.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/17.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SR_UserInfoDetail : NSObject
//登录后修改状态
+ (void)setLoginMark;
//获取登录状态
+ (BOOL)getLoginMark;
//退出
+ (void)loginOut;
@end


