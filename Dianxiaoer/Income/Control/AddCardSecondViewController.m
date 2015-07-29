//
//  AddCardSecondViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/23.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "AddCardSecondViewController.h"

@interface AddCardSecondViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UIButton *protocolBtn;

@end

@implementation AddCardSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeFrame:SCREENWIDTH/320 withObjcet:_backBtn];
    [self changeFrame:SCREENWIDTH/320 withObjcet:_submitBtn];
    [self changeFrame:SCREENWIDTH/320 withObjcet:_protocolBtn];
    // Do any additional setup after loading the view.
}
- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
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
