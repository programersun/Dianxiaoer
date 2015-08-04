//
//  MerchantBidViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/20.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MerchantBidViewController.h"
#import "ShareView.h"
#import "MorePostViewController.h"
#import "SubmitChooseDay.h"
#import "ApplyViewController.h"

@interface MerchantBidViewController () <SubmitChooseDayDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *workingEnvironmentScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundVIew;

@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIButton *moreDaysBtn;

@property (weak, nonatomic) IBOutlet UIButton *scrollToLeftBtn;
@property (weak, nonatomic) IBOutlet UIButton *scrollToRigthBtn;
@property (weak, nonatomic) IBOutlet UIButton *moreWorkBtn;
@property (weak, nonatomic) IBOutlet UIButton *conulstBtn;
@property (weak, nonatomic) IBOutlet UIButton *enlistBtn;

@property (nonatomic, strong) SubmitChooseDay *submitChooseDay;
@property (nonatomic, strong) ShareView *shareView;
@property (nonatomic, assign) UIImage *backgroundImg;
@end

@implementation MerchantBidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _backgroundImg = [UIImage imageNamed:@"MerchantBid"];
    _backgroundVIew.image = _backgroundImg;
    _mainScrollView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    
    CGFloat heightChange = SCREENWIDTH  / _backgroundImg.size.width;
    
    _mainScrollView.contentSize = CGSizeMake(SCREENWIDTH , _backgroundImg.size.height * heightChange);
    
    [self changeFrame:heightChange withObjcet:_backgroundVIew];
    [self changeFrame:heightChange withObjcet:_backBtn];
    [self changeFrame:heightChange withObjcet:_shareBtn];
    [self changeFrame:heightChange withObjcet:_moreDaysBtn];
    [self changeFrame:heightChange withObjcet:_scrollToLeftBtn];
    [self changeFrame:heightChange withObjcet:_workingEnvironmentScrollView];
    [self changeFrame:heightChange withObjcet:_scrollToRigthBtn];
    [self changeFrame:heightChange withObjcet:_moreWorkBtn];
    [self changeFrame:heightChange withObjcet:_conulstBtn];
    [self changeFrame:heightChange withObjcet:_enlistBtn];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//点击返回按钮
- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}
//点击分享按钮
- (IBAction)shareBtnClick:(id)sender {
    UINib *nib = [UINib nibWithNibName:@"ShareView" bundle:nil];
    _shareView = [nib instantiateWithOwner:nil options:nil][0];
    UITapGestureRecognizer *backTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareViewDisappear)];
    [_shareView addGestureRecognizer:backTouch];
    _shareView.frame = CGRectMake(0, 0,[[UIScreen mainScreen] bounds].size.width , [[UIScreen mainScreen] bounds].size.height);
    _shareView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self.view addSubview:_shareView];
}

- (void)shareViewDisappear {
    [_shareView removeFromSuperview];
}

//点击更多日期按钮
- (IBAction)moreDaysBtnClick:(id)sender {
    
}
//点击向左按钮
- (IBAction)scrollToLeftBtnClick:(id)sender {
    
}
//点击向右按钮
- (IBAction)scrollToRightBtnClick:(id)sender {
    
}
//点击更多岗位按钮
- (IBAction)moreWorkBtnClick:(id)sender {
    MorePostViewController *vc = [[UIStoryboard storyboardWithName:@"Merchant" bundle:nil] instantiateViewControllerWithIdentifier:@"MorePostViewController"];
    if (vc == nil) {
        vc = [[MorePostViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}
//点击咨询按钮
- (IBAction)consultBtnClick:(id)sender {
    if ([self needLogin]) {
        [self toLoginVC];
    }
    else {
    
    }
}
//点击应征按钮
- (IBAction)enlistBtnClick:(id)sender {
    if ([self needLogin]) {
        [self toLoginVC];
    }
    else {
        [self submitChooseViewAppear];
    }
}

#pragma mark - SubmitChooseDayDelegate

- (void)submitChooseDayBtnClick {
    ApplyViewController *vc = [[UIStoryboard storyboardWithName:@"Apply" bundle:nil] instantiateViewControllerWithIdentifier:@"ApplyViewController"];
    if (vc == nil) {
        vc = [[ApplyViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
    

}

- (void)submitChooseViewAppear {
    UINib *nib = [UINib nibWithNibName:@"SubmitChooseDay" bundle:nil];
    _submitChooseDay = [nib instantiateWithOwner:nil options:nil][0];
    UITapGestureRecognizer *backTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(submitChooseViewDisappear)];
    [_submitChooseDay.backgroundImg addGestureRecognizer:backTouch];
    _submitChooseDay.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self changeFrame:SCREENWIDTH/320 withObjcet:_submitChooseDay.submitBtn];
    _submitChooseDay.delegate = self;
    [self.view addSubview:_submitChooseDay];
    
}

- (void)submitChooseViewDisappear {
    [_submitChooseDay removeFromSuperview];
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
