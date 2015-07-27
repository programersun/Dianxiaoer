//
//  LoginViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/17.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
#import "SR_UserInfoDetail.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}
- (IBAction)registBtnClick:(id)sender {
    RegistViewController *vc = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"RegistViewController"];
    if (vc == nil) {
        vc = [[RegistViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

- (IBAction)forgetBtnClick:(id)sender {
    
}

- (IBAction)loginBtnClick:(id)sender {
    [SR_UserInfoDetail setLoginMark];
//    [self toRootView];
    [self backBtnClick];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
