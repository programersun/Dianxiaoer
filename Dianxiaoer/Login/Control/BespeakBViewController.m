//
//  BespeakBViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/18.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "BespeakBViewController.h"
#import "BespeakCViewController.h"
#import "bespeakAlertView.h"
#import "MoreAddressAlert.h"

@interface BespeakBViewController () <bespeakAlertViewDelegate>
@property (nonatomic, strong) bespeakAlertView *bespeakAlertView;
@property (nonatomic, strong) MoreAddressAlert *moreAddressAlert;
@end

@implementation BespeakBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtnClick:(id)sender {
    //    [self toRootView];
    [self backBtnClick];
}

- (IBAction)rightBtnClick:(id)sender {
    [self bespeakAlertViewAppear];
}

- (IBAction)moreAddressBtnClick:(id)sender {
    UINib *nib = [UINib nibWithNibName:@"MoreAddressAlert" bundle:nil];
    _moreAddressAlert = [nib instantiateWithOwner:nil options:nil][0];
    UITapGestureRecognizer *backTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moreAddressAlertViewDisappear)];
    [_moreAddressAlert addGestureRecognizer:backTouch];
    [self.view addSubview:_moreAddressAlert];
}


- (IBAction)submitBtnClick:(id)sender {
    BespeakCViewController *vc = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"BespeakCViewController"];
    if (vc == nil) {
        vc = [[BespeakCViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

#pragma MARK: bespeakAlertViewDelegate
- (void)tobespeakVC {
    [self bespeakAlertViewDisappear];
}
- (void)bespeakAlertViewAppear {
    UINib *nib = [UINib nibWithNibName:@"BespeakAlertView" bundle:nil];
    _bespeakAlertView = [nib instantiateWithOwner:nil options:nil][0];
    _bespeakAlertView.delegate = self;
    [self.view addSubview:_bespeakAlertView];
}

- (void)bespeakAlertViewDisappear {
    [_bespeakAlertView removeFromSuperview];
}

- (void)moreAddressAlertViewDisappear {
    [_moreAddressAlert removeFromSuperview];
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