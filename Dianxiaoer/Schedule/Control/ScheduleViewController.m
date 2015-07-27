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

@interface ScheduleViewController () <UITableViewDataSource,UITableViewDelegate,ScheduleOtherHeaderViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *scheduleTableView;
@property (strong, nonatomic) NSMutableArray *cellOpenArray;

@end

@implementation ScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cellOpenArray = [[NSMutableArray alloc] initWithObjects:@"1",@"0",@"0",@"0",@"0",@"0",@"0",@"1",@"1",nil];
    // Do any additional setup after loading the view.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)topViewClick:(id)sender {
    [_scheduleTableView setContentOffset:CGPointMake(0, 0) animated:YES];
    _cellOpenArray = [[NSMutableArray alloc] initWithObjects:@"1",@"0",@"0",@"0",@"0",@"0",@"0",@"1",@"1",nil];
    [_scheduleTableView reloadData];
}

#pragma MARK: UITableViewDelegate,UITableViewDataSource ,UIGestureRecognizerDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section <= 6) {
        return 100;
    }
    else {
        return 224;
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
        return 80;
    }
    else {
        return 100;
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

- (void)toTaskApplyViewController {
    TaskApplyViewController *vc = [[UIStoryboard storyboardWithName:@"Task" bundle:nil] instantiateViewControllerWithIdentifier:@"TaskApplyViewController"];
    if (vc == nil) {
        vc = [[TaskApplyViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 3) {
                //
            }
            else {
                [self toTaskApplyViewController];
            }
            break;
        }
        case 1:
        {
            if (indexPath.row == 1) {
                //
            }
            else {
                [self toTaskApplyViewController];
            }
            break;
        }
        case 2:
        {
            //
            break;
        }
        case 3:
        {
            //
            break;
        }
        case 4:
        {
            if (indexPath.row == 2) {
                //
            }
            else {
                [self toTaskApplyViewController];
            }
            break;
        }
        case 5:
        {
            //
            break;
        }
        case 6:
        {
            if (indexPath.row == 2) {
                //
            }
            else {
                [self toTaskApplyViewController];
            }
            
            break;
        }
        case 7:
        {
            //
            break;
        }
        case 8:
        {
            //
            break;
        }
        default:
            break;
    }
}

#pragma MARK: ScheduleOtherHeaderViewDelegate
- (void)dayCellSelect:(UIButton *)sender {
    for (int i = 1 ; i <= 6 ; i++) {
        if (sender.tag == 100 + i) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
