//
//  AddCardFirstViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/23.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "AddCardFirstViewController.h"
#import "AddCardSecondViewController.h"

@interface AddCardFirstViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end

@implementation AddCardFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changeFrame:SCREENWIDTH/320 withObjcet:_backBtn];
    [self changeFrame:SCREENWIDTH/320 withObjcet:_nextBtn];
    // Do any additional setup after loading the view.
}
- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}
- (IBAction)nextBtnClick:(id)sender {
    AddCardSecondViewController *vc = [[UIStoryboard storyboardWithName:@"Income" bundle:nil] instantiateViewControllerWithIdentifier:@"AddCardSecondViewController"];
    if (vc == nil) {
        vc = [[AddCardSecondViewController alloc] init];
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
