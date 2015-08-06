//
//  ModifyMainViewController.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/6.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "ModifyMainViewController.h"
#import "BasicInfoViewController.h"

@interface ModifyMainViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImg;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *basicInfoBtn;
@property (weak, nonatomic) IBOutlet UIButton *imageShowBtn;
@property (weak, nonatomic) IBOutlet UIButton *realNameIdBtn;
@property (weak, nonatomic) IBOutlet UIButton *healthInfoBtn;
@property (weak, nonatomic) IBOutlet UIButton *skillShowBtn;
@property (weak, nonatomic) IBOutlet UIButton *socialContactBtn;

@end

@implementation ModifyMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changeFrame:HEIGHTCHANGE withObjcet:_backBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_basicInfoBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_imageShowBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_realNameIdBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_healthInfoBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_skillShowBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_socialContactBtn];
    
    // Do any additional setup after loading the view.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}
- (IBAction)basicInfoBtnClick:(id)sender {
    BasicInfoViewController *myInfoDetailVC = [[UIStoryboard storyboardWithName:@"My" bundle:nil] instantiateViewControllerWithIdentifier:@"BasicInfoViewController"];
    if (myInfoDetailVC == nil) {
        myInfoDetailVC = [[BasicInfoViewController alloc] init];
    }
    [[self navigationController] pushViewController:myInfoDetailVC animated:YES];
}
- (IBAction)imageShowBtnClick:(id)sender {
    
}
- (IBAction)realNameIdBtnClick:(id)sender {
    
}
- (IBAction)healthInfoBtnClick:(id)sender {
    
}
- (IBAction)skillShowBtnClick:(id)sender {
    
}

- (IBAction)socialContactBtnClick:(id)sender {
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
