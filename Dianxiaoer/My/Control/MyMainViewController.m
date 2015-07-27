//
//  MyMainViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/16.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MyMainViewController.h"
#import "SettingViewController.h"
#import "MyInfoViewController.h"
#import "SkillViewController.h"
#import "QrCodeViewController.h"

@interface MyMainViewController ()

@end

@implementation MyMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nameBtnClick:(id)sender {
    MyInfoViewController *myInfoVC = [[UIStoryboard storyboardWithName:@"My" bundle:nil] instantiateViewControllerWithIdentifier:@"MyInfoViewController"];
    if (myInfoVC == nil) {
        myInfoVC = [[MyInfoViewController alloc] init];
    }
    [[self navigationController] pushViewController:myInfoVC animated:YES];
}

- (IBAction)infoFirstBtnClick:(id)sender {
    
}
- (IBAction)infoSecondBtnClick:(id)sender {
    SkillViewController *skillVC = [[UIStoryboard storyboardWithName:@"My" bundle:nil] instantiateViewControllerWithIdentifier:@"SkillViewController"];
    if (skillVC == nil) {
        skillVC = [[SkillViewController alloc] init];
    }
    [[self navigationController] pushViewController:skillVC animated:YES];

}
- (IBAction)qrCodeBtnClick:(id)sender {
    QrCodeViewController *qrCodeVC = [[UIStoryboard storyboardWithName:@"My" bundle:nil] instantiateViewControllerWithIdentifier:@"QrCodeViewController"];
    if (qrCodeVC == nil) {
        qrCodeVC = [[QrCodeViewController alloc] init];
    }
    [[self navigationController] pushViewController:qrCodeVC animated:YES];
}
- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)settinBtnClick:(id)sender {
    SettingViewController *settingVC = [[UIStoryboard storyboardWithName:@"My" bundle:nil] instantiateViewControllerWithIdentifier:@"SettingViewController"];
    if (settingVC == nil) {
        settingVC = [[SettingViewController alloc] init];
    }
    [[self navigationController] pushViewController:settingVC animated:YES];
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
