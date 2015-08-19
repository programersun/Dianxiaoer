//
//  UIViewController+Category.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/17.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "UIViewController+Category.h"
#import "LoginViewController.h"
#import "SR_UserInfoDetail.h"

@implementation UIViewController (Category)
- (void)toLoginVC {
    LoginViewController *vc = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginViewController"];
    if (vc == nil) {
        vc = [[LoginViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
//    self.view.window.rootViewController = vc;
//    UINavigationController *nav = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginNav"];
//    if (nav == nil) {
//        nav = [[UINavigationController alloc] init];
//    }
//    self.view.window.rootViewController = nav;
}

- (BOOL)needLogin {
    if ([SR_UserInfoDetail getLoginMark]) {
        return YES;
    }
    else {
        return NO;
    }
}

- (void)backBtnClick {
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)toRootView {
    [[self navigationController] popToRootViewControllerAnimated:YES];
}

- (void)tel {
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"tel:%@",@"18565650046"];
    UIWebView *callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
}

- (void)changeFrame:(CGFloat)heightChange withObjcet:(UIView * )sender {
    sender.frame = CGRectMake(sender.frame.origin.x * heightChange, sender.frame.origin.y * heightChange,sender.frame.size.width * heightChange, sender.frame.size.height * heightChange);
}

- (void)changeTabBarFrame:(CGFloat)heightChange withObjcet:(UIView * )sender {
    sender.frame = CGRectMake(sender.frame.origin.x * heightChange, sender.frame.origin.y * heightChange,sender.frame.size.width * heightChange, sender.frame.size.height);
}

@end
