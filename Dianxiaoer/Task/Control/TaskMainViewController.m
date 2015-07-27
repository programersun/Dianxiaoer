//
//  TaskMainViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/20.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "TaskMainViewController.h"
#import "MerchantInfoViewController.h"
#import "MyInfoViewController.h"
#import "MerchantBidViewController.h"
#import "BuyMainViewController.h"

@interface TaskMainViewController ()

@end

@implementation TaskMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)taskBuyBtnClick:(id)sender {
    
    MerchantBidViewController *vc = [[UIStoryboard storyboardWithName:@"Merchant" bundle:nil] instantiateViewControllerWithIdentifier:@"MerchantBidViewController"];
    if (vc == nil) {
        vc = [[MerchantBidViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

- (IBAction)taskBuyHeadBtnClick:(id)sender {
    MerchantInfoViewController *myMianVC = [[UIStoryboard storyboardWithName:@"Merchant" bundle:nil] instantiateViewControllerWithIdentifier:@"MerchantInfoViewController"];
    if (myMianVC == nil) {
        myMianVC = [[MerchantInfoViewController alloc] init];
    }
    [[self navigationController] pushViewController:myMianVC animated:YES];
}

- (IBAction)taskReleaseBtnClick:(id)sender {
    BuyMainViewController *vc = [[UIStoryboard storyboardWithName:@"TaskBuy" bundle:nil] instantiateViewControllerWithIdentifier:@"BuyMainViewController"];
    if (vc == nil) {
        vc = [[BuyMainViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

- (IBAction)taskReleaseHeadBtnClick:(id)sender {
    MyInfoViewController *vc = [[UIStoryboard storyboardWithName:@"My" bundle:nil] instantiateViewControllerWithIdentifier:@"MyInfoViewController"];
    if (vc == nil) {
        vc = [[MyInfoViewController alloc] init];
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
