//
//  SkillViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/16.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "SkillViewController.h"

@interface SkillViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *cellBtn1;
@property (weak, nonatomic) IBOutlet UIButton *cellBtn2;
@property (weak, nonatomic) IBOutlet UIButton *cellBtn3;
@property (weak, nonatomic) IBOutlet UIButton *cellBtn4;
@property (weak, nonatomic) IBOutlet UIButton *cellBtn5;

@end

@implementation SkillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeFrame:HEIGHTCHANGE withObjcet:_backBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_cellBtn1];
    [self changeFrame:HEIGHTCHANGE withObjcet:_cellBtn2];
    [self changeFrame:HEIGHTCHANGE withObjcet:_cellBtn3];
    [self changeFrame:HEIGHTCHANGE withObjcet:_cellBtn4];
    [self changeFrame:HEIGHTCHANGE withObjcet:_cellBtn5];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}
//高级管理
- (IBAction)BtnClick1:(id)sender {
    
}
//高级服务
- (IBAction)BtnClick2:(id)sender {
    
}
//职业素养
- (IBAction)BtnClick3:(id)sender {
    
}
//仪容礼仪
- (IBAction)BtnClick4:(id)sender {
    
}
//服务理念
- (IBAction)BtnClick5:(id)sender {
    
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
