//
//  BespeakDViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/18.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "BespeakDViewController.h"
#import "BespeakEViewController.h"
#import "bespeakAlertView.h"

@interface BespeakDViewController () <bespeakAlertViewDelegate>
@property (nonatomic, strong) bespeakAlertView *bespeakAlertView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
    @property (weak, nonatomic) IBOutlet UIButton *rightBtn;
    @property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@end

@implementation BespeakDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changeFrame:HEIGHTCHANGE withObjcet:_backBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_rightBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_nextBtn];
    // Do any additional setup after loading the view.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)rightBtnClick:(id)sender {
    [self bespeakAlertViewAppear];
}

- (IBAction)submitBtnClick:(id)sender {
    BespeakEViewController *vc = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"BespeakEViewController"];
    if (vc == nil) {
        vc = [[BespeakEViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
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
