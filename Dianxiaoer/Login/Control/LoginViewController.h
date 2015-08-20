//
//  LoginViewController.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/17.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  LoginViewControllerDelegate

@optional
- (void)toBackVC;

@end

@interface LoginViewController : UIViewController
@property (nonatomic, assign) id <LoginViewControllerDelegate> delegate;
@end
