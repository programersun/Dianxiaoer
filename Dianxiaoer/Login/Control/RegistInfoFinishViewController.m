//
//  RegistInfoFinishViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/17.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "RegistInfoFinishViewController.h"
#import "UpLoadIDViewController.h"
#import "UpLoadIDCardFirstViewController.h"
#import "bespeakAlertView.h"
#import "bespeakViewController.h"
#import "GiveUpBespeakAlert.h"

@interface RegistInfoFinishViewController () <bespeakAlertViewDelegate,GiveUpBespeakAlertDelegate>
@property (nonatomic, strong) bespeakAlertView *bespeakAlertView;
@property (nonatomic, strong) GiveUpBespeakAlert *giveUpBespeakAlert;

@property (weak, nonatomic) IBOutlet UIButton *bespeakNowBtn;
@property (weak, nonatomic) IBOutlet UIButton *upLoadBtn;

@property (weak, nonatomic) IBOutlet UIButton *giveUpBtn;

@end

@implementation RegistInfoFinishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeFrame:HEIGHTCHANGE withObjcet:_bespeakNowBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_upLoadBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_giveUpBtn];
    // Do any additional setup after loading the view.
}

//弹出预约跳转提示
- (IBAction)bespeakBtnClick:(id)sender {
    [self bespeakAlertViewAppear];
}
//跳转到健康证录入
- (IBAction)upLoadIDBtnClick:(id)sender {
    UpLoadIDViewController *vc = [[UIStoryboard storyboardWithName:@"My" bundle:nil] instantiateViewControllerWithIdentifier:@"UpLoadIDViewController"];
    if (vc == nil) {
        vc = [[UpLoadIDViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}
//以后再说
- (IBAction)cancelBtnClick:(id)sender {
    UINib *nib = [UINib nibWithNibName:@"GiveUpBespeakAlert" bundle:nil];
    _giveUpBespeakAlert = [nib instantiateWithOwner:nil options:nil][0];
    _giveUpBespeakAlert.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    _giveUpBespeakAlert.delegate = self;
    [self changeFrame:HEIGHTCHANGE withObjcet:_giveUpBespeakAlert.backgroundView];
    [self changeFrame:HEIGHTCHANGE withObjcet:_giveUpBespeakAlert.backgroundImg];
    [self changeFrame:HEIGHTCHANGE withObjcet:_giveUpBespeakAlert.submitBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_giveUpBespeakAlert.giveUpBtn];
    [self.view addSubview:_giveUpBespeakAlert];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - GiveUpBespeakAlertDelegate

- (void)toRootVC {
    [self toRootView];
}

#pragma mark - bespeakAlertViewDelegate
- (void)tobespeakVC {
    
    UpLoadIDCardFirstViewController *vc = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"UpLoadIDCardFirstViewController"];
    if (vc == nil) {
        vc = [[UpLoadIDCardFirstViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];

//    bespeakViewController *vc = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"bespeakViewController"];
//    if (vc == nil) {
//        vc = [[bespeakViewController alloc] init];
//    }
//    [[self navigationController] pushViewController:vc animated:YES];
}

- (void)bespeakAlertViewAppear {
    UINib *nib = [UINib nibWithNibName:@"BespeakAlertView" bundle:nil];
    _bespeakAlertView = [nib instantiateWithOwner:nil options:nil][0];
    UITapGestureRecognizer *backTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bespeakAlertViewDisappear)];
    [_bespeakAlertView.backgroundView addGestureRecognizer:backTouch];
    _bespeakAlertView.delegate = self;
    [self changeFrame:HEIGHTCHANGE withObjcet:_bespeakAlertView.submitBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_bespeakAlertView.alertImgView];
    [self changeFrame:HEIGHTCHANGE withObjcet:_bespeakAlertView.backgroundView];
    [self.view addSubview:_bespeakAlertView];
}

- (void)bespeakAlertViewDisappear {
    [_bespeakAlertView removeFromSuperview];
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
