//
//  MerchantBidViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/20.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MerchantBidViewController.h"
#import "ShareView.h"
#import "MorePostViewController.h"
#import "SubmitChooseDay.h"
#import "ApplyViewController.h"

@interface MerchantBidViewController () <SubmitChooseDayDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *workingEnvironmentScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundTopView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundButtomView;
@property (weak, nonatomic) IBOutlet UIButton *topLeftBtn;
@property (weak, nonatomic) IBOutlet UIButton *topRightBtn;

@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIButton *moreDaysBtn;

@property (weak, nonatomic) IBOutlet UIButton *scrollToLeftBtn;
@property (weak, nonatomic) IBOutlet UIButton *scrollToRigthBtn;
@property (weak, nonatomic) IBOutlet UIButton *moreWorkBtn;
@property (weak, nonatomic) IBOutlet UIButton *conulstBtn;
@property (weak, nonatomic) IBOutlet UIButton *enlistBtn;

@property (nonatomic, strong) SubmitChooseDay *submitChooseDay;
@property (nonatomic, strong) ShareView *shareView;

@property (nonatomic, strong) UIPanGestureRecognizer *scrollDown;
@property (nonatomic, strong) UIPanGestureRecognizer *scrollUp;

@property CGFloat startPanY;
@property CGFloat oldContentOffsetY;
@property CGFloat startContentOffsetY;
@end

@implementation MerchantBidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mainScrollView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    
    CGFloat heightChange = SCREENWIDTH  / 320;
    
    _mainScrollView.contentSize = CGSizeMake(SCREENWIDTH , 1858 * heightChange);
    
    [self changeFrame:heightChange withObjcet:_backgroundTopView];
    [self changeFrame:heightChange withObjcet:_backgroundButtomView];
    [self changeFrame:heightChange withObjcet:_topLeftBtn];
    [self changeFrame:heightChange withObjcet:_topRightBtn];
    [self changeFrame:heightChange withObjcet:_backBtn];
    [self changeFrame:heightChange withObjcet:_shareBtn];
    [self changeFrame:heightChange withObjcet:_moreDaysBtn];
    [self changeFrame:heightChange withObjcet:_scrollToLeftBtn];
    [self changeFrame:heightChange withObjcet:_workingEnvironmentScrollView];
    [self changeFrame:heightChange withObjcet:_scrollToRigthBtn];
    [self changeFrame:heightChange withObjcet:_moreWorkBtn];
    [self changeFrame:heightChange withObjcet:_conulstBtn];
    [self changeFrame:heightChange withObjcet:_enlistBtn];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//点击返回按钮
- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}
//点击分享按钮
- (IBAction)shareBtnClick:(id)sender {
    UINib *nib = [UINib nibWithNibName:@"ShareView" bundle:nil];
    _shareView = [nib instantiateWithOwner:nil options:nil][0];
    UITapGestureRecognizer *backTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareViewDisappear)];
    [_shareView addGestureRecognizer:backTouch];
    _shareView.frame = CGRectMake(0, 0,[[UIScreen mainScreen] bounds].size.width , [[UIScreen mainScreen] bounds].size.height);
    _shareView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self.view addSubview:_shareView];
}

- (void)shareViewDisappear {
    [_shareView removeFromSuperview];
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
    if ([self needLogin]) {
        [self toLoginVC];
    }
    else {
    
    }
}
//点击应征按钮
- (IBAction)enlistBtnClick:(id)sender {
    if ([self needLogin]) {
        [self toLoginVC];
    }
    else {
        [self submitChooseViewAppear];
    }
}

#pragma mark - SubmitChooseDayDelegate

- (void)submitChooseDayBtnClick {
    ApplyViewController *vc = [[UIStoryboard storyboardWithName:@"Apply" bundle:nil] instantiateViewControllerWithIdentifier:@"ApplyViewController"];
    if (vc == nil) {
        vc = [[ApplyViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
    

}

- (void)submitChooseViewAppear {
    UINib *nib = [UINib nibWithNibName:@"SubmitChooseDay" bundle:nil];
    _submitChooseDay = [nib instantiateWithOwner:nil options:nil][0];
    UITapGestureRecognizer *backTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(submitChooseViewDisappear)];
    [_submitChooseDay.backgroundImg addGestureRecognizer:backTouch];
    _submitChooseDay.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self changeFrame:SCREENWIDTH/320 withObjcet:_submitChooseDay.submitBtn];
    _submitChooseDay.delegate = self;
    [self.view addSubview:_submitChooseDay];
    
}

- (void)submitChooseViewDisappear {
    [_submitChooseDay removeFromSuperview];
}

#pragma mark - UIScrollViewDelegate

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    _startContentOffsetY = scrollView.contentOffset.y;
//    _oldContentOffsetY = scrollView.contentOffset.y;
//}
//
//
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat newcontentOffsetY = scrollView.contentOffset.y;
//    CGFloat heightChange = newcontentOffsetY - _oldContentOffsetY;
//    
//    if (heightChange > 0) {
//        if (newcontentOffsetY >= 262 * HEIGHTCHANGE ) {
//            if (newcontentOffsetY <= 262 * HEIGHTCHANGE + SCREENHEIGHT / 2) {
//                [UIView animateWithDuration:1.0 animations:^{
//                    [scrollView setContentOffset:CGPointMake(0, 260 * HEIGHTCHANGE) animated:YES];
//                }];
//                
//            }
//            else {
//                [UIView animateWithDuration:1.0 animations:^{
//                    [scrollView setContentOffset:CGPointMake(0, 830 * HEIGHTCHANGE) animated:NO];
//                }];
//            }
//        }
//    }
//    else {
//        
//    }
//    
//}


//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat newcontentOffsetY = scrollView.contentOffset.y;
//    if (newcontentOffsetY <= 830 * HEIGHTCHANGE) {
//        if (newcontentOffsetY >= 262 * HEIGHTCHANGE) {
//            [UIView animateWithDuration:1.0 animations:^{
//                [scrollView setContentOffset:CGPointMake(0, 260 * HEIGHTCHANGE) animated:NO];
//            }completion:^(BOOL finished) {
//                if (newcontentOffsetY >= 262 * HEIGHTCHANGE + SCREENHEIGHT / 3) {
//                    [UIView animateWithDuration:1.0 animations:^{
//                        [scrollView setContentOffset:CGPointMake(0, 830 * HEIGHTCHANGE) animated:NO];
//                    }];
//                }
//            }];
////            _scrollDown = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDown)];
////            [_mainScrollView addGestureRecognizer:_scrollDown];
//            
//        }
//        
//    }
//    if (newcontentOffsetY >= 830 * HEIGHTCHANGE) {
//        if (newcontentOffsetY <= 830 * HEIGHTCHANGE) {
//            [scrollView setContentOffset:CGPointMake(0, 830 * HEIGHTCHANGE) animated:YES];
////            _scrollUp = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewUp)];
////            [_mainScrollView addGestureRecognizer:_scrollUp];
//        }
//        
//    }
//}

//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
//    
//    [_mainScrollView removeGestureRecognizer:_scrollUp];
//}

//- (void)scrollViewDown {
//    CGFloat endPanY;
//    if (_scrollDown.state == UIGestureRecognizerStateBegan) {
//        _startPanY = _scrollDown.view.center.y;
//        NSLog(@"%f",_startPanY);
//    }
//
//    if (_scrollDown.state == UIGestureRecognizerStateChanged)
//    {
//        
//        endPanY = _scrollDown.view.center.y;
//        NSLog(@"%f",endPanY);
//        
//    }
//    
//    if (_startPanY - endPanY > SCREENHEIGHT / 2) {
//        [_mainScrollView setContentOffset:CGPointMake(0, 830) animated:YES];
//    }
//    
//    if (_scrollDown.state == UIGestureRecognizerStateEnded) {
//        [_mainScrollView removeGestureRecognizer:_scrollDown];
//    }
//
//}
//
//- (void)scrollViewUp {
//    
//    
//}
//
//



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
