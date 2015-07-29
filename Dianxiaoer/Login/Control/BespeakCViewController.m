//
//  BespeakView3Controller.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/18.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "BespeakCViewController.h"
#import "BespeakDViewController.h"
#import "BespeakEViewController.h"
#import "bespeakAlertView.h"

@interface BespeakCViewController () <bespeakAlertViewDelegate>
@property (nonatomic, strong) bespeakAlertView *bespeakAlertView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (nonatomic, assign) BOOL isBySelf;
@end

@implementation BespeakCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isBySelf = YES;
    [self changeBackground];
    // Do any additional setup after loading the view.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)rightBtnClick:(id)sender {
    [self bespeakAlertViewAppear];
}

- (IBAction)getSelfBtnClick:(id)sender {
    _isBySelf = YES;
    [self changeBackground];
}

- (IBAction)entrustBtnClick:(id)sender {
    _isBySelf = NO;
    [self changeBackground];
}

- (IBAction)submitBtnClick:(id)sender {
    BespeakDViewController *vc = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"BespeakDViewController"];
    if (vc == nil) {
        vc = [[BespeakDViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

- (void)changeBackground {
    if (_isBySelf) {
        [_backgroundView setImage:[UIImage imageNamed:@"bespeak03_1"]];
    }
    else {
        [_backgroundView setImage:[UIImage imageNamed:@"bespeak03_2"]];
    }
}

#pragma MARK: bespeakAlertViewDelegate
- (void)tobespeakVC {
    [self bespeakAlertViewDisappear];
}
- (void)bespeakAlertViewAppear {
    UINib *nib = [UINib nibWithNibName:@"BespeakAlertView" bundle:nil];
    _bespeakAlertView = [nib instantiateWithOwner:nil options:nil][0];
    _bespeakAlertView.delegate = self;
    _bespeakAlertView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
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
