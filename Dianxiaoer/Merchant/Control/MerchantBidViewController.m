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

@interface MerchantBidViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *workingEnvironmentScrollView;

@property (nonatomic, strong) ShareView *shareView;
@property (nonatomic, assign) UIImage *backgroundImg;
@end

@implementation MerchantBidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _backgroundImg = [UIImage imageNamed:@"MerchantBid"];
    _mainScrollView.contentSize = _backgroundImg.size;
    
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
        
    }
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
