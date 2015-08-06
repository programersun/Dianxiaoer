//
//  WithdrewSuccessViewController.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/6.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "WithdrewSuccessViewController.h"

@interface WithdrewSuccessViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImg;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@end

@implementation WithdrewSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeFrame:HEIGHTCHANGE withObjcet:_backBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_submitBtn];
    // Do any additional setup after loading the view.
}
- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}
- (IBAction)submitBtnClick:(id)sender {
    [self toRootView];
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
