//
//  MorePostViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/20.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MorePostViewController.h"
#import "MerchantBidViewController.h"
#import "MoreShopViewController.h"
#import "MorePostDetailViewController.h"

@interface MorePostViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (nonatomic, assign) UIImage *backgroundImg;

@end

@implementation MorePostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _backgroundImg = [UIImage imageNamed:@"morePost"];
    [_mainScrollView setContentSize:CGSizeMake(_backgroundImg.size.width, _backgroundImg.size.height - 1)];
    
    // Do any additional setup after loading the view.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

//
- (IBAction)cellBtnClick:(id)sender {
    MorePostDetailViewController *vc = [[UIStoryboard storyboardWithName:@"Merchant" bundle:nil] instantiateViewControllerWithIdentifier:@"MorePostDetailViewController"];
    if (vc == nil) {
        vc = [[MorePostDetailViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

//点击其他门店按钮
- (IBAction)moreShopBtnClick:(id)sender {
    MoreShopViewController *vc = [[UIStoryboard storyboardWithName:@"Merchant" bundle:nil] instantiateViewControllerWithIdentifier:@"MoreShopViewController"];
    if (vc == nil) {
        vc = [[MoreShopViewController alloc] init];
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
