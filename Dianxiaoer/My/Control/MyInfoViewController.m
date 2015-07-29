//
//  MyInfoViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/16.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MyInfoViewController.h"

@interface MyInfoViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *myInfoScrollView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;

@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (nonatomic, assign) UIImage *backgroundImg;

@end

@implementation MyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _backgroundImg = [UIImage imageNamed:@"MyInfo"];
    _backgroundView.image = _backgroundImg;
    _myInfoScrollView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    _myInfoScrollView.contentSize = CGSizeMake(SCREENWIDTH , _backgroundImg.size.height * HEIGHTCHANGE);
    
    [self changeFrame:HEIGHTCHANGE withObjcet:_backgroundView];
    [self changeFrame:HEIGHTCHANGE withObjcet:_backBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_rightBtn];
    // Do any additional setup after loading the view.
}

- (IBAction)backClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)rightBtnClick:(id)sender {
    
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
