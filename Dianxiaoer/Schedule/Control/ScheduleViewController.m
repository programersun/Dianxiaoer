//
//  ScheduleViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/22.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "ScheduleViewController.h"
#import "ScheduleDateTableViewCell.h"
#import "ScheduleTableViewCell.h"
#import "NoScheduleTableViewCell.h"
#import "ScheduleOtherHeaderView.h"
#import "ScheduleMonthHeaderView.h"
#import "TaskApplyViewController.h"
#import "ReleaseViewController.h"
#import "ScheduleDetailViewController.h"

@interface ScheduleViewController () <UITableViewDataSource,UITableViewDelegate,ScheduleOtherHeaderViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *scheduleTableView;

@property (weak, nonatomic) IBOutlet UIView *tabBarView;
@property (weak, nonatomic) IBOutlet UIView *tabBarAppearView;

@property (weak, nonatomic) IBOutlet UIButton *mainTabBtn;
@property (weak, nonatomic) IBOutlet UIButton *taskTabBtn;
@property (weak, nonatomic) IBOutlet UIButton *purseTabBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewButtom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tabBarAppearViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tabBarViewButtom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tabBarViewHeight;

@property (assign, nonatomic) CGFloat oldcontentOffsetY;
@property BOOL tabBarHidden;
@property BOOL tabBarAppear;
@property (strong, nonatomic) NSMutableArray *cellOpenArray;

@end

@implementation ScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cellOpenArray = [[NSMutableArray alloc] initWithObjects:@"1",@"0",@"0",@"0",@"0",@"0",@"0",@"1",@"1",nil];
    self.navigationController.navigationBar.hidden = YES;
    [self changeTabBarImg];
    _tabBarAppearViewHeight.constant = 20 * HEIGHTCHANGE;
    _tabBarHidden = YES;
    _tabBarAppear = YES;
    _tabBarAppearView.hidden = YES;
    _tabBarViewHeight.constant = 49 * HEIGHTCHANGE;
    _tableViewButtom.constant = 49 * HEIGHTCHANGE;
    // Do any additional setup after loading the view.
}

- (void)changeTabBarImg {
    
    [_mainTabBtn setImage:[UIImage imageNamed:@"mainTab"] forState:UIControlStateNormal];
    [_taskTabBtn setImage:[UIImage imageNamed:@"taskTabSelect"] forState:UIControlStateNormal];
    [_purseTabBtn setImage:[UIImage imageNamed:@"purseTab"] forState:UIControlStateNormal];
}

- (IBAction)tabBarAppearBtnClick:(id)sender {
    _tableViewButtom.constant = 49 * HEIGHTCHANGE;
    _tabBarViewButtom.constant = 0;
}

- (IBAction)mainTabBtnClick:(id)sender {
    UINavigationController *nav = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainNav"];
    if (nav == nil) {
        nav = [[UINavigationController alloc] init];
    }
    self.view.window.rootViewController = nav;
    
}

- (IBAction)taskTabBtnClick:(id)sender {
    
}

- (IBAction)purseTabBtnClick:(id)sender {
    if ([self needLogin]) {
        [self toLoginVC];
    }
    else {
        UINavigationController *nav = [[UIStoryboard storyboardWithName:@"Income" bundle:nil] instantiateViewControllerWithIdentifier:@"IncomeNav"];
        if (nav == nil) {
            nav = [[UINavigationController alloc] init];
        }
        self.view.window.rootViewController = nav;
    }
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)topViewClick:(id)sender {
    [_scheduleTableView setContentOffset:CGPointMake(0, 0) animated:YES];
    _cellOpenArray = [[NSMutableArray alloc] initWithObjects:@"1",@"0",@"0",@"0",@"0",@"0",@"0",@"1",@"1",nil];
    [_scheduleTableView reloadData];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource ,UIGestureRecognizerDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section <= 6) {
        return 100 * HEIGHTCHANGE;
    }
    else {
        return 224 * HEIGHTCHANGE;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 9;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([[_cellOpenArray objectAtIndex:section]  isEqual: @"1"]) {
        
        switch (section) {
            case 0:
                return 4;
                break;
            case 1:
                return 2;
                break;
            case 2:
                return 1;
                break;
            case 3:
                return 1;
                break;
            case 4:
                return 3;
                break;
            case 5:
                return 1;
                break;
            case 6:
                return 3;
                break;
            case 7:
                return 1;
                break;
            case 8:
                return 1;
                break;
            default:
                return 0;
        }

    }
    else {
        return 0;
    }

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UINib *scheduleOtherHeaderViewNib = [UINib nibWithNibName:@"ScheduleOtherHeaderView" bundle:nil];
    ScheduleOtherHeaderView *scheduleOtherHeaderView = [scheduleOtherHeaderViewNib instantiateWithOwner:nil options:nil][0];
    scheduleOtherHeaderView.delegate = self;
    UINib *scheduleMonthHeaderViewNib = [UINib nibWithNibName:@"ScheduleMonthHeaderView" bundle:nil];
    ScheduleMonthHeaderView *scheduleMonthHeaderView = [scheduleMonthHeaderViewNib instantiateWithOwner:nil options:nil][0];

    if (section == 0) {
        return nil;
    }
    if (section <= 6) {
        NSString * otherHeaderImgName = [[NSString alloc] initWithFormat:@"Schedule0%ld",(long)section];
        scheduleOtherHeaderView.backBtn.tag = 100 + section;
        scheduleOtherHeaderView.backImg.image = [UIImage imageNamed:otherHeaderImgName];
    }
    if (section == 7 || section == 8) {
        NSString * monthHeaderImgName = [[NSString alloc] initWithFormat:@"ScheduleMonthHeader0%ld",(long)section];
        scheduleMonthHeaderView.backImg.image = [UIImage imageNamed:monthHeaderImgName];
    }
    
    switch (section) {
        case 1:
            return scheduleOtherHeaderView;
            break;
        case 2:
            return scheduleOtherHeaderView;
            break;
        case 3:
            return scheduleOtherHeaderView;
            break;
        case 4:
            return scheduleOtherHeaderView;
            break;
        case 5:
            return scheduleOtherHeaderView;
            break;
        case 6:
            return scheduleOtherHeaderView;
            break;
        case 7:
            return scheduleMonthHeaderView;
            break;
        case 8:
            return scheduleMonthHeaderView;
            break;
        default:
            return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    else if (section == 7 || section == 8) {
        return 79 * HEIGHTCHANGE;
    }
    else {
        return 99 * HEIGHTCHANGE;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ScheduleTableViewCell *scheduleCell = [tableView dequeueReusableCellWithIdentifier:@"ScheduleTableViewCell"];
    NoScheduleTableViewCell *noScheduleCell = [tableView dequeueReusableCellWithIdentifier:@"NoScheduleTableViewCell"];
    ScheduleDateTableViewCell *scheduleDateCell = [tableView dequeueReusableCellWithIdentifier:@"ScheduleDateTableViewCell"];
    if (indexPath.section <= 6) {
        if (scheduleCell == nil) {
            scheduleCell = [[ScheduleTableViewCell alloc] init];
        }
        if (noScheduleCell == nil) {
            noScheduleCell = [[NoScheduleTableViewCell alloc] init];
        }
    }
    else if (indexPath.section == 7 || indexPath.section == 8) {
        if (scheduleDateCell == nil) {
            scheduleDateCell = [[ScheduleDateTableViewCell alloc] init];
        }
    }
    
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 3) {
                return noScheduleCell;
            }
            else {
                return scheduleCell;
            }
            break;
        }
        case 1:
        {
            if (indexPath.row == 1) {
                return noScheduleCell;
            }
            else {
                return scheduleCell;
            }
            break;
        }
        case 2:
        {
            return noScheduleCell;
            break;
        }
        case 3:
        {
            return noScheduleCell;
            break;
        }
        case 4:
        {
            if (indexPath.row == 2) {
                return noScheduleCell;
            }
            else {
                return scheduleCell;
            }
            break;
        }
        case 5:
        {
            return noScheduleCell;
            break;
        }
        case 6:
        {
            if (indexPath.row == 2) {
                return noScheduleCell;
            }
            else {
                return scheduleCell;
            }

            break;
        }
        case 7:
        {
            return scheduleDateCell;
            break;
        }
        case 8:
        {
            return scheduleDateCell;
            break;
        }
        default:
            return nil;
    }
}

- (void)toScheduleDetailViewController {
    ScheduleDetailViewController *vc = [[UIStoryboard storyboardWithName:@"ScheduleDetail" bundle:nil] instantiateViewControllerWithIdentifier:@"ScheduleDetailViewController"];
    if (vc == nil) {
        vc = [[ScheduleDetailViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

- (void)toTaskApplyViewController {
    TaskApplyViewController *vc = [[UIStoryboard storyboardWithName:@"Task" bundle:nil] instantiateViewControllerWithIdentifier:@"TaskApplyViewController"];
    if (vc == nil) {
        vc = [[TaskApplyViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

- (void)toReleaseViewController {
    ReleaseViewController *vc = [[UIStoryboard storyboardWithName:@"Release" bundle:nil] instantiateViewControllerWithIdentifier:@"ReleaseViewController"];
    if (vc == nil) {
        vc = [[ReleaseViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 3) {
                [self toReleaseViewController];
            }
            else {
//                [self toTaskApplyViewController];
                [self toScheduleDetailViewController];
            }
            break;
        }
        case 1:
        {
            if (indexPath.row == 1) {
                [self toReleaseViewController];
            }
            else {
//                [self toTaskApplyViewController];
                [self toScheduleDetailViewController];
            }
            break;
        }
        case 2:
        {
            [self toReleaseViewController];
            break;
        }
        case 3:
        {
            [self toReleaseViewController];
            break;
        }
        case 4:
        {
            if (indexPath.row == 2) {
                [self toReleaseViewController];
            }
            else {
//                [self toTaskApplyViewController];
                [self toScheduleDetailViewController];
            }
            break;
        }
        case 5:
        {
            [self toReleaseViewController];
            break;
        }
        case 6:
        {
            if (indexPath.row == 2) {
                [self toReleaseViewController];
            }
            else {
//                [self toTaskApplyViewController];
                [self toScheduleDetailViewController];
            }
            
            break;
        }
        case 7:
        {
            [self toReleaseViewController];
            break;
        }
        case 8:
        {
            [self toReleaseViewController];
            break;
        }
        default:
            break;
    }
}

#pragma mark - ScheduleOtherHeaderViewDelegate
- (void)dayCellSelect:(UIButton *)sender {
    for (int i = 1 ; i <= 6 ; i++) {
        if (sender.tag == 100 + i && [[_cellOpenArray objectAtIndex:i] isEqualToString:@"0"]) {
            [_cellOpenArray replaceObjectAtIndex:i withObject:@"1"];
        }
        else {
            [_cellOpenArray replaceObjectAtIndex:i withObject:@"0"];
        }
    }
    [UIView animateWithDuration:1.0 animations:^{
        [_scheduleTableView reloadData];
    }];
}

- (void)cellBackBtnClick {
    [self backBtnClick];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        if (heightChange > 0 && _tabBarHidden) {
            _tableViewButtom.constant = 20 * HEIGHTCHANGE;
            _tabBarViewButtom.constant = -49 * HEIGHTCHANGE ;
            _tabBarHidden = NO;
            _tabBarAppear = YES;
            _tabBarAppearView.hidden = NO;
        }
        if (heightChange < 0 && _tabBarAppear) {
            _tableViewButtom.constant = 49 * HEIGHTCHANGE;
            _tabBarViewButtom.constant = 0;
            _tabBarAppear = NO;
            _tabBarHidden = YES;
            _tabBarAppearView.hidden = YES;
        }
    }
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
