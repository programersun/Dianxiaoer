//
//  MorePostDetailViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/21.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MorePostDetailViewController.h"
#import "MerchantInfoViewController.h"
#import "MerchanBidMainViewController.h"

@interface MorePostDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *headImg;
@property (weak, nonatomic) IBOutlet UIButton *cellBtn;
@property (weak, nonatomic) IBOutlet UIButton *cellNextBtn;


@property (nonatomic, assign) UIImage *backgroundImg;
@end

@implementation MorePostDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _backgroundImg = [UIImage imageNamed:@"morePostDetail"];
    _backgroundView.image = _backgroundImg;
    
    CGFloat heightChange = SCREENWIDTH  / _backgroundImg.size.width;
    [self changeFrame:heightChange withObjcet:_backgroundView];
    [self changeFrame:heightChange withObjcet:_backBtn];
    [self changeFrame:heightChange withObjcet:_headImg];
    [self changeFrame:heightChange withObjcet:_cellBtn];
    [self changeFrame:heightChange withObjcet:_cellNextBtn];
    // Do any additional setup after loading the view.
}

//点击返回按钮
- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

//点击商店头像按钮
- (IBAction)shopHeadImgBtnClick:(id)sender {
    MerchantInfoViewController *vc = [[UIStoryboard storyboardWithName:@"Merchant" bundle:nil] instantiateViewControllerWithIdentifier:@"MerchantInfoViewController"];
    if (vc == nil) {
        vc = [[MerchantInfoViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];

}

//点击岗位详情按钮
- (IBAction)postDetailBtnClick:(id)sender {
    MerchanBidMainViewController *vc = [[UIStoryboard storyboardWithName:@"Merchant" bundle:nil] instantiateViewControllerWithIdentifier:@"MerchanBidMainViewController"];
    if (vc == nil) {
        vc = [[MerchanBidMainViewController alloc] init];
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
