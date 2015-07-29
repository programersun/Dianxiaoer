//
//  MoreShopViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/21.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MoreShopViewController.h"
#import "MorePostViewController.h"

@interface MoreShopViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *cellBtn;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;

@property (nonatomic, assign) UIImage *backgroundImg;
@end

@implementation MoreShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _backgroundImg = [UIImage imageNamed:@"moreShop"];
    _backgroundView.image = _backgroundImg;
    
    CGFloat heightChange = SCREENWIDTH  / _backgroundImg.size.width;
    [self changeFrame:heightChange withObjcet:_backgroundView];
    [self changeFrame:heightChange withObjcet:_backBtn];
    [self changeFrame:heightChange withObjcet:_cellBtn];

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

//点击更多岗位按钮
- (IBAction)postDetailBtnClick:(id)sender {
    MorePostViewController *vc = [[UIStoryboard storyboardWithName:@"Merchant" bundle:nil] instantiateViewControllerWithIdentifier:@"MorePostViewController"];
    if (vc == nil) {
        vc = [[MorePostViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
//    [self backBtnClick];
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
