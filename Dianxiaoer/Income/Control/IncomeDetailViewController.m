//
//  IncomeDetailViewController.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/7.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "IncomeDetailViewController.h"
#import "WithdrewMainViewController.h"

@interface IncomeDetailViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UISwipeGestureRecognizer *tableUp;
@property (nonatomic, strong) UISwipeGestureRecognizer *tableDown;
@property (assign, nonatomic) BOOL isUp;

@property CGFloat oldcontentOffsetY;
@property UIImage *detailImg;

@end

@implementation IncomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _detailImg = [UIImage imageNamed:@"incomeDetail"];
    
    _detailScrollView.contentSize = CGSizeMake(_detailImg.size.width * HEIGHTCHANGE, _detailImg.size.height * HEIGHTCHANGE);
    
    [self changeFrame:HEIGHTCHANGE withObjcet:_backBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_detailView];
    [self changeFrame:HEIGHTCHANGE withObjcet:_detailHeadView];
    [self changeFrame:HEIGHTCHANGE withObjcet:_withdrewBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_backgroundImg];
    [self changeFrame:HEIGHTCHANGE withObjcet:_detailScrollView];
    [self changeFrame:HEIGHTCHANGE withObjcet:_detailScrollImg];
    [self changeFrame:HEIGHTCHANGE withObjcet:_detailHeadViewImg];
    
    _isUp = YES;
    [self addSwipe];
    
    // Do any additional setup after loading the view.
}

//给小叮当增加滑动手势
- (void)addSwipe {
    _tableUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(incomeTableViewUp)];
    [_tableUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [_detailHeadView addGestureRecognizer:_tableUp];
    _tableDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(incomeTableViewDown)];
    [_tableDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [_detailHeadView addGestureRecognizer:_tableDown];
}

- (void)incomeTableViewUp {
    if (_tableUp.state == UIGestureRecognizerStateEnded) {
        [self detailViewUp];
    }
}

- (void)incomeTableViewDown {
    if (_tableDown.state == UIGestureRecognizerStateEnded) {
        [self detailViewDown];
    }
}

- (void)detailViewUp {
    if (_isUp) {
        _isUp = NO;
        _detailView.frame = CGRectMake(_detailView.frame.origin.x, _detailView.frame.origin.y , _detailView.frame.size.width , 450 * HEIGHTCHANGE);
        _detailScrollView.frame = CGRectMake(_detailScrollView.frame.origin.x, _detailScrollView.frame.origin.y, _detailScrollView.frame.size.width, (450 - 98) * HEIGHTCHANGE);
        [UIView animateWithDuration:0.5 animations:^{
            _detailView.frame = CGRectMake(_detailView.frame.origin.x, 118 * HEIGHTCHANGE, _detailView.frame.size.width , _detailView.frame.size.height);
        }];
    }

}

- (void)detailViewDown {
    if (_isUp == NO) {
        _isUp = YES;
        [UIView animateWithDuration:0.5 animations:^{
            _detailView.frame = CGRectMake(_detailView.frame.origin.x, 420 * HEIGHTCHANGE , _detailView.frame.size.width , 450 * HEIGHTCHANGE);
        }completion:^(BOOL finished) {
            _detailView.frame = CGRectMake(_detailView.frame.origin.x, _detailView.frame.origin.y, _detailView.frame.size.width , 148 * HEIGHTCHANGE);
            _detailScrollView.frame = CGRectMake(_detailScrollView.frame.origin.x, _detailScrollView.frame.origin.y, _detailScrollView.frame.size.width, 148 * HEIGHTCHANGE);
        }];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat newcontentOffsetY = scrollView.contentOffset.y;
    CGFloat heightChange = newcontentOffsetY - _oldcontentOffsetY;
    if (_isUp) {
        if (heightChange > 0) {
            [self detailViewUp];
        }
    }
    else {
        if (heightChange < 0 && newcontentOffsetY < -30) {
            [self detailViewDown];
        }
    }

}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}
- (IBAction)withdrewBtnClick:(id)sender {
    WithdrewMainViewController *vc = [[UIStoryboard storyboardWithName:@"Income" bundle:nil] instantiateViewControllerWithIdentifier:@"WithdrewMainViewController"];
    if (vc == nil) {
        vc = [[WithdrewMainViewController alloc] init];
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
