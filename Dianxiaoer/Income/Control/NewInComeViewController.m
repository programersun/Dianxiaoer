//
//  NewInComeViewController.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/20.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "NewInComeViewController.h"
#import "NewInComeFirstTableViewCell.h"
#import "NewInComeSecondTableViewCell.h"
#import "NewInComeThirdTableViewCell.h"
#import "NewNoInComeTableViewCell.h"
#import "MyBankCardViewController.h"
#import "WithdrewMainViewController.h"
#import "IncomeDetailViewController.h"

#define INCOMECOUNT 3

@interface NewInComeViewController () <UITableViewDataSource,UITableViewDelegate,NewInComeSecondTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topVIewTop;
@property (weak, nonatomic) IBOutlet UIButton *mainTabBtn;
@property (weak, nonatomic) IBOutlet UIButton *taskTabBtn;
@property (weak, nonatomic) IBOutlet UIButton *purseTabBtn;
@property (weak, nonatomic) IBOutlet UIView *tabBarAppearView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewButtom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tabBarAppearViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tabBarViewButtom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tabBarViewHeight;
@property (weak, nonatomic) IBOutlet UIView *tabBarView;
@property (assign, nonatomic) CGFloat oldcontentOffsetY;
@property BOOL tabBarHidden;
@property BOOL tabBarAppear;
@end

@implementation NewInComeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
    _topVIewTop.constant = 0;
    _tabBarAppearViewHeight.constant = 20 * HEIGHTCHANGE;
    [self changeTabBarImg];
    _tabBarHidden = YES;
    _tabBarAppear = YES;
    _tabBarAppearView.hidden = YES;
    _tabBarViewHeight.constant = 49 * HEIGHTCHANGE;
    _tableViewButtom.constant = 49 * HEIGHTCHANGE;

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

#pragma mark - NewInComeSecondTableViewCellDelegate

- (void)toWithrewVC {
    WithdrewMainViewController *vc = [[UIStoryboard storyboardWithName:@"Income" bundle:nil] instantiateViewControllerWithIdentifier:@"WithdrewMainViewController"];
    if (vc == nil) {
        vc = [[WithdrewMainViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

- (void)toBankCardVC {
    MyBankCardViewController *vc = [[UIStoryboard storyboardWithName:@"Income" bundle:nil] instantiateViewControllerWithIdentifier:@"MyBankCardViewController"];
    if (vc == nil) {
        vc = [[MyBankCardViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

- (void)toInComeDetailVC {
    IncomeDetailViewController *vc = [[UIStoryboard storyboardWithName:@"Income" bundle:nil] instantiateViewControllerWithIdentifier:@"IncomeDetailViewController"];
    if (vc == nil) {
        vc = [[IncomeDetailViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource ,UIGestureRecognizerDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return 199 * HEIGHTCHANGE;
        case 1:
            return 85 * HEIGHTCHANGE;
        case 2:
            if (INCOMECOUNT == 0 ) {
                return SCREENHEIGHT - (49 + 64 + 199 + 85) * HEIGHTCHANGE;
            }
            else {
                return 166 * HEIGHTCHANGE;
            }
        default:
            return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 1;
        case 2:
            if (INCOMECOUNT == 0 ) {
                return 1;
            }
            else {
                return INCOMECOUNT;
            }
            
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
        {
            NewInComeFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewInComeFirstTableViewCell"];
            if (cell == nil) {
                cell = [[NewInComeFirstTableViewCell alloc] init];
            }
            return cell;
        }
        case 1:
        {
            NewInComeSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewInComeSecondTableViewCell"];
            if (cell == nil) {
                cell = [[NewInComeSecondTableViewCell alloc] init];
            }
            cell.delegate = self;
            return cell;
        }
        case 2:
            if (INCOMECOUNT == 0 ) {
                {
                    NewNoInComeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewNoInComeTableViewCell"];
                    if (cell == nil) {
                        cell = [[NewNoInComeTableViewCell alloc] init];
                    }
                    return cell;
                }
            }
            else {
                {
                    NewInComeThirdTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewInComeThirdTableViewCell"];
                    if (cell == nil) {
                        cell = [[NewInComeThirdTableViewCell alloc] init];
                    }
                    return cell;
                }
            }
            
        default:
            return nil;
    }
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _oldcontentOffsetY = scrollView.contentOffset.y;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    _tabBarHidden = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat newcontentOffsetY = scrollView.contentOffset.y;
    CGFloat heightChange = newcontentOffsetY - _oldcontentOffsetY;
    
    if (newcontentOffsetY > 0) {
        if (newcontentOffsetY + SCREENHEIGHT < scrollView.contentSize.height) {
            if (heightChange > 0) {
                
                if (_topView.frame.origin.y > -64 && _topView.frame.origin.y - heightChange >= -64) {
                    _topVIewTop.constant = _topVIewTop.constant - heightChange;
                }
                else {
                    _topVIewTop.constant = -64;
                }
                
                if (_tabBarHidden) {
                    _tableViewButtom.constant = 20 * HEIGHTCHANGE;
                    _tabBarViewButtom.constant = -49  * HEIGHTCHANGE;
                    _tabBarHidden = NO;
                    _tabBarAppear = YES;
                    _tabBarAppearView.hidden = NO;
                    
                }
            }
            else {
                if (_topView.frame.origin.y < 0 && _topView.frame.origin.y - heightChange <= 0) {
                    _topVIewTop.constant = _topVIewTop.constant - heightChange;
                }
                else {
                    _topVIewTop.constant = 0;
                }
                
                if (_tabBarAppear) {
                    _tableViewButtom.constant = 49 * HEIGHTCHANGE;
                    _tabBarViewButtom.constant = 0;
                    _tabBarAppear = NO;
                    _tabBarHidden = YES;
                    _tabBarAppearView.hidden = YES;
                }
                
            }
        }
        else {
            _topVIewTop.constant = -64;
        }
        
    }
    else {
        _topVIewTop.constant = 0;
    }
    
    _oldcontentOffsetY = newcontentOffsetY;
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
