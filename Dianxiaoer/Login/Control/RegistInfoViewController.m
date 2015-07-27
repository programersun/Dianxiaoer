//
//  RegistInfoViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/17.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "RegistInfoViewController.h"
#import "RegistInfoFinishViewController.h"

@interface RegistInfoViewController ()
@property (weak, nonatomic) IBOutlet UIButton *nanBtn;
@property (weak, nonatomic) IBOutlet UIButton *nvBtn;

@property (assign, nonatomic) BOOL nanOrnv;
@end

@implementation RegistInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _nanOrnv = YES;
    [self setNanOrnvImg];
    // Do any additional setup after loading the view.
}

//设置男女按钮
- (void)setNanOrnvImg {
    if (_nanOrnv == YES) {
        [_nanBtn setImage:[UIImage imageNamed:@"nanselect"] forState:UIControlStateNormal];
        [_nvBtn setImage:[UIImage imageNamed:@"nv"] forState:UIControlStateNormal];
    }
    else {
        [_nanBtn setImage:[UIImage imageNamed:@"nan"] forState:UIControlStateNormal];
        [_nvBtn setImage:[UIImage imageNamed:@"nvselect"] forState:UIControlStateNormal];
    }
}

- (IBAction)backBtnClick:(id)sender {
    [self toRootView];
}
- (IBAction)nanBtnClick:(id)sender {
    _nanOrnv = YES;
    [self setNanOrnvImg];
}
- (IBAction)nvBtnClick:(id)sender {
    _nanOrnv = NO;
    [self setNanOrnvImg];
}
- (IBAction)finishBtnClick:(id)sender {
    RegistInfoFinishViewController *vc = [[UIStoryboard storyboardWithName:@"Login" bundle:nil] instantiateViewControllerWithIdentifier:@"RegistInfoFinishViewController"];
    if (vc == nil) {
        vc = [[RegistInfoFinishViewController alloc] init];
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
