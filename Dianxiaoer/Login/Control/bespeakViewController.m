//
//  bespeakViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/17.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "bespeakViewController.h"
#import "BespeakBViewController.h"
#import "bespeakAlertView.h"
#import "PaySuccessAlertView.h"

@interface bespeakViewController () <bespeakAlertViewDelegate,paySuccessAlertViewDelegate>
@property (nonatomic, strong) bespeakAlertView *bespeakAlertView;
@property (nonatomic, strong) PaySuccessAlertView *paySuccessAlertView;

@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (weak, nonatomic) IBOutlet UIButton *otherPayBtn;

@end

@implementation bespeakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changeFrame:HEIGHTCHANGE withObjcet:_backBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_rightBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_nextBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_otherPayBtn];
    // Do any additional setup after loading the view.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)rightBtnClick:(id)sender {
    [self bespeakAlertViewAppear];
}

- (IBAction)submitBtnClick:(id)sender {
    [self paySuccessAlertViewAppear];
}

- (IBAction)otherPayBtnClick:(id)sender {
    
}

#pragma mark - paySuccessAlertViewDelegate

- (void)toNextVC {
    BespeakBViewController *vc = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"BespeakBViewController"];
    if (vc == nil) {
        vc = [[BespeakBViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

- (void)paySuccessAlertViewAppear {
    UINib *nib = [UINib nibWithNibName:@"PaySuccessAlertView" bundle:nil];
    _paySuccessAlertView = [nib instantiateWithOwner:nil options:nil][0];
    UITapGestureRecognizer *backTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(paySuccessAlertViewDisappear)];
    [_paySuccessAlertView.backgroundView addGestureRecognizer:backTouch];
    [self changeFrame:HEIGHTCHANGE withObjcet:_paySuccessAlertView.alertImgView];
    [self changeFrame:HEIGHTCHANGE withObjcet:_paySuccessAlertView.submitBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_paySuccessAlertView.backgroundView];
    
    _paySuccessAlertView.delegate = self;
    [self.view addSubview:_paySuccessAlertView];
}

- (void)paySuccessAlertViewDisappear {
    [_paySuccessAlertView removeFromSuperview];
}

#pragma mark - bespeakAlertViewDelegate
- (void)tobespeakVC {
    [self bespeakAlertViewDisappear];
}
- (void)bespeakAlertViewAppear {
    UINib *nib = [UINib nibWithNibName:@"BespeakAlertView" bundle:nil];
    _bespeakAlertView = [nib instantiateWithOwner:nil options:nil][0];
    _bespeakAlertView.delegate = self;
    [self changeFrame:HEIGHTCHANGE withObjcet:_bespeakAlertView.submitBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_bespeakAlertView.alertImgView];
    [self changeFrame:HEIGHTCHANGE withObjcet:_bespeakAlertView.backgroundView];
    [self.view addSubview:_bespeakAlertView];
}

- (void)bespeakAlertViewDisappear {
    [_bespeakAlertView removeFromSuperview];
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
