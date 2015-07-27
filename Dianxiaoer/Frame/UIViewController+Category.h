//
//  UIViewController+Category.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/17.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Category)
- (BOOL)needLogin;
- (void)toLoginVC;
- (void)backBtnClick;
- (void)toRootView;
- (void)tel;
@end
