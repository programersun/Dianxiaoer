//
//  RegistViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/17.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "RegistViewController.h"
#import "SR_UserInfoDetail.h"
#import "RegistInfoViewController.h"

@interface RegistViewController ()
@property (weak, nonatomic) IBOutlet UITextField *telText;
@property (weak, nonatomic) IBOutlet UITextField *verificationText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@property (nonatomic, assign) BOOL showPassword;
@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _showPassword = NO;
    // Do any additional setup after loading the view.
}
- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}
- (IBAction)sendBtnClick:(id)sender {
    
}
//隐藏和显示密码
- (IBAction)changeTypeBtnClick:(id)sender {
    
    if (_showPassword == YES) {
        _passwordText.secureTextEntry = NO;
        _showPassword = NO;
    }
    else {
        _passwordText.secureTextEntry = YES;
        _showPassword = YES;
    }
}
- (IBAction)registBtnClick:(id)sender {
    [SR_UserInfoDetail setLoginMark];
    RegistInfoViewController *vc = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"RegistInfoViewController"];
    if (vc == nil) {
        vc = [[RegistInfoViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
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
