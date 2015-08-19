//
//  MerchantInfoViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/20.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MerchantInfoViewController.h"

@interface MerchantInfoViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *workingEnvironmentScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *scrollToLeftBtn;
@property (weak, nonatomic) IBOutlet UIButton *scrollToRightBtn;
@property (weak, nonatomic) IBOutlet UIButton *consultBtn;


@property (nonatomic, assign) UIImage *backgroundImg;
@end

@implementation MerchantInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _backgroundImg = [UIImage imageNamed:@"MerchantInfo"];
    _backgroundView.image = _backgroundImg;
    _mainScrollView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    CGFloat heightChange = SCREENWIDTH  / _backgroundImg.size.width;
    _mainScrollView.contentSize = CGSizeMake(SCREENWIDTH , _backgroundImg.size.height * heightChange - 1);
    
    [self changeFrame:heightChange withObjcet:_backgroundView];
    [self changeFrame:heightChange withObjcet:_backBtn];
    [self changeFrame:heightChange withObjcet:_scrollToLeftBtn];
    [self changeFrame:heightChange withObjcet:_scrollToRightBtn];
    [self changeFrame:heightChange withObjcet:_consultBtn];

    // Do any additional setup after loading the view.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

//点击向左按钮
- (IBAction)scrollToLeftBtnClick:(id)sender {
    
}
//点击向右按钮
- (IBAction)scrollToRightBtnClick:(id)sender {
    
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
