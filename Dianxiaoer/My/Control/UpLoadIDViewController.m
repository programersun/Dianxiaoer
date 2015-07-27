//
//  UpLoadIDViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/16.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "UpLoadIDViewController.h"

@interface UpLoadIDViewController ()

@end

@implementation UpLoadIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)cancelBtnClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)submitBtnClick:(id)sender {
    [self toRootView];
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
