//
//  MyInfoDetailViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/16.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MyInfoDetailViewController.h"
#import "FinshInputMyInfoView.h"
#import "UpLoadIDViewController.h"
#import "UpLoadIDCardViewController.h"

@interface MyInfoDetailViewController () <FinshInputMyInfoViewDelegate>
@property (nonatomic, strong) FinshInputMyInfoView *backgroundView;
@end

@implementation MyInfoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}


- (IBAction)upLoadIDCardBtnClick:(id)sender {
    UpLoadIDCardViewController *vc = [[UIStoryboard storyboardWithName:@"My" bundle:nil] instantiateViewControllerWithIdentifier:@"UpLoadIDCardViewController"];
    if (vc == nil) {
        vc = [[UpLoadIDCardViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

- (IBAction)submitBtnClick:(id)sender {
    [self backgroudViewAppear];
}

- (void)backgroudViewAppear {
    UINib *nib = [UINib nibWithNibName:@"FinshInputMyInfoView" bundle:nil];
    _backgroundView = [nib instantiateWithOwner:nil options:nil][0];
    _backgroundView.delegate = self;
    [self.view addSubview:_backgroundView];
}

- (void)backgroundViewDisappear {
    [_backgroundView removeFromSuperview];
}

- (void)toUpLoadIDVC {

    UpLoadIDViewController *vc = [[UIStoryboard storyboardWithName:@"My" bundle:nil] instantiateViewControllerWithIdentifier:@"UpLoadIDViewController"];
    if (vc == nil) {
        vc = [[UpLoadIDViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
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
