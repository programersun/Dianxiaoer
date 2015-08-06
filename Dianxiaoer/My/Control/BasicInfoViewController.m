//
//  BasicInfoViewController.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/6.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "BasicInfoViewController.h"

@interface BasicInfoViewController ()
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *topViewImg;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *scrollBackgroundImg;

@end

@implementation BasicInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mainScrollView.frame = CGRectMake(0, 64 * HEIGHTCHANGE, SCREENWIDTH, SCREENHEIGHT - 64 * HEIGHTCHANGE);
    _mainScrollView.contentSize = CGSizeMake(SCREENWIDTH , 571 * HEIGHTCHANGE);
    [self changeFrame:HEIGHTCHANGE withObjcet:_backBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_saveBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_topView];
    [self changeFrame:HEIGHTCHANGE withObjcet:_topViewImg];
    [self changeFrame:HEIGHTCHANGE withObjcet:_scrollBackgroundImg];
    
    // Do any additional setup after loading the view.
}
- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}
- (IBAction)saveBtnClick:(id)sender {
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
