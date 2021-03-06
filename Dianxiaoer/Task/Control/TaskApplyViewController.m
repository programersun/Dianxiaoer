//
//  TaskApplyViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/20.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "TaskApplyViewController.h"
#import "MorePostViewController.h"

@interface TaskApplyViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *workingEnvironmentScrollView;
@property (weak, nonatomic) IBOutlet UIButton *buttomLeftBtn;
@property (weak, nonatomic) IBOutlet UIButton *buttomRightBtn;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *moreDaysBtn;
@property (weak, nonatomic) IBOutlet UIButton *scrollToLeftBtn;
@property (weak, nonatomic) IBOutlet UIButton *scrollToRightBtn;
@property (weak, nonatomic) IBOutlet UIButton *moreWorkBtn;

@property (nonatomic, assign) UIImage *backgroundImg;
@end

@implementation TaskApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _backgroundImg = [UIImage imageNamed:@"TaskApplyImg"];
    _backgroundView.image = _backgroundImg;
    _mainScrollView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    
    CGFloat heightChange = SCREENWIDTH  / _backgroundImg.size.width;
    
    _mainScrollView.contentSize = CGSizeMake(SCREENWIDTH , _backgroundImg.size.height * heightChange);
    
    [self changeFrame:heightChange withObjcet:_backgroundView];
    [self changeFrame:heightChange withObjcet:_backBtn];
    [self changeFrame:heightChange withObjcet:_moreDaysBtn];
    [self changeFrame:heightChange withObjcet:_scrollToLeftBtn];
    [self changeFrame:heightChange withObjcet:_workingEnvironmentScrollView];
    [self changeFrame:heightChange withObjcet:_scrollToRightBtn];
    [self changeFrame:heightChange withObjcet:_moreWorkBtn];
    [self changeFrame:heightChange withObjcet:_buttomLeftBtn];
    [self changeFrame:heightChange withObjcet:_buttomRightBtn];
    
    
    // Do any additional setup after loading the view.
}

//点击返回按钮
- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

//点击更多日期按钮
- (IBAction)moreDaysBtnClick:(id)sender {
    
}


//点击向左按钮
- (IBAction)scrollToLeftBtnClick:(id)sender {
    
}
//点击向右按钮
- (IBAction)scrollToRightBtnClick:(id)sender {
    
}
//点击更多岗位按钮
- (IBAction)moreWorkBtnClick:(id)sender {
    MorePostViewController *vc = [[UIStoryboard storyboardWithName:@"Merchant" bundle:nil] instantiateViewControllerWithIdentifier:@"MorePostViewController"];
    if (vc == nil) {
        vc = [[MorePostViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}
//点击咨询按钮
- (IBAction)consultBtnClick:(id)sender {
    
}
//点击应征按钮
- (IBAction)enlistBtnClick:(id)sender {
    
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
