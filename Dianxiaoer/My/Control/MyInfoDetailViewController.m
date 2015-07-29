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
#import "UpLoadIDCardFirstViewController.h"

@interface MyInfoDetailViewController () <FinshInputMyInfoViewDelegate>
@property (nonatomic, strong) FinshInputMyInfoView *backgroundView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UIButton *upLoadIDCardBtn;

@end

@implementation MyInfoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeFrame:HEIGHTCHANGE withObjcet:_backBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_submitBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_upLoadIDCardBtn];
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
    _backgroundView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self changeFrame:HEIGHTCHANGE withObjcet:_backgroundView.bespeakBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_backgroundView.upLoadBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_backgroundView.cancelBtn];
    [self.view addSubview:_backgroundView];
}

- (void)backgroundViewDisappear {
    [_backgroundView removeFromSuperview];
}

#pragma mark - FinshInputMyInfoViewDelegate

- (void)toUpLoadIDVC {
    [self backgroundViewDisappear];
    UpLoadIDViewController *vc = [[UIStoryboard storyboardWithName:@"My" bundle:nil] instantiateViewControllerWithIdentifier:@"UpLoadIDViewController"];
    if (vc == nil) {
        vc = [[UpLoadIDViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

- (void)toBespeakVC {
    [self backgroundViewDisappear];
    UpLoadIDCardFirstViewController *vc = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"UpLoadIDCardFirstViewController"];
    if (vc == nil) {
        vc = [[UpLoadIDCardFirstViewController alloc] init];
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
