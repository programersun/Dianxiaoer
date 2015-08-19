//
//  IncomeViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/21.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "IncomeViewController.h"
#import "IncomeTableViewCell.h"
#import "MyBankCardViewController.h"
#import "WithdrewMainViewController.h"
#import "IncomeDetailViewController.h"
#define INCOMECOUNT 3

@interface IncomeViewController () <UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *bellImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITableView *incomeTableView;
@property (weak, nonatomic) IBOutlet UIImageView *noIncomeImg;
@property (weak, nonatomic) IBOutlet UIButton *bankCardBtn;
@property (weak, nonatomic) IBOutlet UIButton *withdrewBtn;
@property (weak, nonatomic) IBOutlet UIButton *incomeDetailBtn;

@property (weak, nonatomic) IBOutlet UIView *tabBarView;
@property (weak, nonatomic) IBOutlet UIView *tabBarBackgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *tabBarViewLine;

@property (weak, nonatomic) IBOutlet UIButton *mainTabBtn;
@property (weak, nonatomic) IBOutlet UIButton *taskTabBtn;
@property (weak, nonatomic) IBOutlet UIButton *purseTabBtn;


@property (nonatomic, strong) UISwipeGestureRecognizer *tableUp;
@property (nonatomic, strong) UISwipeGestureRecognizer *tableDown;
@property (assign, nonatomic) BOOL isUp;
@property (assign, nonatomic) CGFloat oldcontentOffsetY;
@end

@implementation IncomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    _incomeTableView.delegate = self;
    [self changeFrame:SCREENWIDTH/319 withObjcet:_incomeTableView];
    [self changeFrame:HEIGHTCHANGE withObjcet:_nameLabel];
    [self changeFrame:HEIGHTCHANGE withObjcet:_bellImg];
    [self changeFrame:HEIGHTCHANGE withObjcet:_noIncomeImg];
    [self changeFrame:HEIGHTCHANGE withObjcet:_bankCardBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_withdrewBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_incomeDetailBtn];
    
    [self changeFrame:HEIGHTCHANGE withObjcet:_tabBarView];
    [self changeFrame:HEIGHTCHANGE withObjcet:_tabBarViewLine];
    [self changeFrame:HEIGHTCHANGE withObjcet:_tabBarBackgroundView];
    [self changeFrame:HEIGHTCHANGE withObjcet:_mainTabBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_taskTabBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_purseTabBtn];
    
    [self changeTabBarImg];
    [self setType];
    [self addSwipe];
    // Do any additional setup after loading the view.
}

- (void)changeTabBarImg {
    
    [_mainTabBtn setImage:[UIImage imageNamed:@"mainTab"] forState:UIControlStateNormal];
    [_taskTabBtn setImage:[UIImage imageNamed:@"taskTab"] forState:UIControlStateNormal];
    [_purseTabBtn setImage:[UIImage imageNamed:@"purseTabSelect"] forState:UIControlStateNormal];
}

- (IBAction)mainTabBtnClick:(id)sender {
    UINavigationController *nav = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainNav"];
    if (nav == nil) {
        nav = [[UINavigationController alloc] init];
    }
    self.view.window.rootViewController = nav;
    
}

- (IBAction)taskTabBtnClick:(id)sender {
    if ([self needLogin]) {
        [self toLoginVC];
    }
    else {
        UINavigationController *nav = [[UIStoryboard storyboardWithName:@"Schedule" bundle:nil] instantiateViewControllerWithIdentifier:@"ScheduleNav"];
        if (nav == nil) {
            nav = [[UINavigationController alloc] init];
        }
        self.view.window.rootViewController = nav;
    }
}

- (IBAction)purseTabBtnClick:(id)sender {
    
}

- (void)setType {

    if (INCOMECOUNT == 0) {
        _isUp = NO;
        _incomeTableView.hidden = YES;
    }
    else {
        _incomeTableView.hidden = NO;
        if (INCOMECOUNT > 1) {
            _isUp = YES;
        }
    }
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)noIncomeBtnClick:(id)sender {
    
}

- (IBAction)withdrewBtnClick:(id)sender {
    WithdrewMainViewController *vc = [[UIStoryboard storyboardWithName:@"Income" bundle:nil] instantiateViewControllerWithIdentifier:@"WithdrewMainViewController"];
    if (vc == nil) {
        vc = [[WithdrewMainViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

- (IBAction)incomeDetailBtnClick:(id)sender {
    IncomeDetailViewController *vc = [[UIStoryboard storyboardWithName:@"Income" bundle:nil] instantiateViewControllerWithIdentifier:@"IncomeDetailViewController"];
    if (vc == nil) {
        vc = [[IncomeDetailViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}


- (IBAction)myBankCardBtnClick:(id)sender {
    MyBankCardViewController *vc = [[UIStoryboard storyboardWithName:@"Income" bundle:nil] instantiateViewControllerWithIdentifier:@"MyBankCardViewController"];
    if (vc == nil) {
        vc = [[MyBankCardViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}


//给小叮当增加滑动手势
- (void)addSwipe {
        _tableUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(incomeTableViewUp)];
        [_tableUp setDirection:UISwipeGestureRecognizerDirectionUp];
        [_bellImg addGestureRecognizer:_tableUp];
        _tableDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(incomeTableViewDown)];
        [_tableDown setDirection:UISwipeGestureRecognizerDirectionDown];
        [_bellImg addGestureRecognizer:_tableDown];
}

- (void)incomeTableViewUp {
    if (_tableUp.state == UIGestureRecognizerStateEnded) {
        [self incomeUp];
    }
}

- (void)incomeTableViewDown {
    if (_tableDown.state == UIGestureRecognizerStateEnded) {
        [self incomeDown];
    }
}

- (void)incomeUp {
    if (_isUp) {
        _isUp = NO;
        [UIView animateWithDuration:0.5 animations:^{
            _nameLabel.frame = CGRectMake(_nameLabel.frame.origin.x, _nameLabel.frame.origin.y - 156 * HEIGHTCHANGE, _nameLabel.frame.size.width , _nameLabel.frame.size.height);
            _bellImg.frame = CGRectMake(_bellImg.frame.origin.x, _bellImg.frame.origin.y - 156 * HEIGHTCHANGE, _bellImg.frame.size.width , _bellImg.frame.size.height);
            _incomeTableView.frame = CGRectMake(0, _incomeTableView.frame.origin.y - 156, _incomeTableView.frame.size.width , _incomeTableView.frame.size.height * 2);
            
        }];
    }

}

- (void)incomeDown {
    if (!_isUp) {
        _isUp = YES;
        [UIView animateWithDuration:0.5 animations:^{
            _nameLabel.frame = CGRectMake(_nameLabel.frame.origin.x, _nameLabel.frame.origin.y + 156 * HEIGHTCHANGE, _nameLabel.frame.size.width , _nameLabel.frame.size.height);
            _bellImg.frame = CGRectMake(_bellImg.frame.origin.x, _bellImg.frame.origin.y + 156 * HEIGHTCHANGE, _bellImg.frame.size.width , _bellImg.frame.size.height);
            _incomeTableView.frame = CGRectMake(0, _incomeTableView.frame.origin.y + 156 , _incomeTableView.frame.size.width , _incomeTableView.frame.size.height);
        }completion:^(BOOL finished) {
            _incomeTableView.frame = CGRectMake(_incomeTableView.frame.origin.x, _incomeTableView.frame.origin.y, _incomeTableView.frame.size.width , _incomeTableView.frame.size.height / 2);
        }];
    }
}


#pragma mark - UITableViewDelegate,UITableViewDataSource ,UIGestureRecognizerDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 156 * HEIGHTCHANGE;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return INCOMECOUNT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    IncomeTableViewCell *incomeCell = [tableView dequeueReusableCellWithIdentifier:@"IncomeTableViewCell"];
    if (incomeCell == nil) {
        incomeCell = [[IncomeTableViewCell alloc] init];
    }
    return incomeCell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _oldcontentOffsetY = scrollView.contentOffset.y;
}



-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat newcontentOffsetY = scrollView.contentOffset.y;
    CGFloat heightChange = newcontentOffsetY - _oldcontentOffsetY;
    
    if (_isUp) {
        if (heightChange > 0) {
            [self incomeUp];
        }
    }
    else {
        if (heightChange < 0 && newcontentOffsetY < -30) {
            [self incomeDown];
        }
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
