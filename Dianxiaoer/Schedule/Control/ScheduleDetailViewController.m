//
//  ScheduleDetailViewController.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/6.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "ScheduleDetailViewController.h"
#import "ScheduleDetailUpTableViewCell.h"
#import "ScheduleDetailButtomTableViewCell.h"
#import "MorePostViewController.h"

@interface ScheduleDetailViewController () <UITableViewDataSource,UITableViewDelegate,ScheduleDetailButtomTableViewCellDelegate,ScheduleDetailUpTableViewCellDelegate>

@property UIImage *upImg;
@property UIImage *downImg;
@property CGFloat upHeight;
@property CGFloat downHeight;
@property BOOL isUpFirstReload;
@property BOOL isButtomFirstReload;

@end

@implementation ScheduleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _upImg = [UIImage imageNamed:@"ScheduleDetailUpImg"];
    _upHeight = _upImg.size.height;
    _downImg = [UIImage imageNamed:@"ScheduleDetailButtomImg"];
    _downHeight = _downImg.size.height;
    _mainTableView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    _isUpFirstReload = YES;
    _isButtomFirstReload = YES;
    
    [self changeFrame:HEIGHTCHANGE withObjcet:_buttomView];
    [self changeFrame:HEIGHTCHANGE withObjcet:_buttomLeftBtn];
    [self changeFrame:HEIGHTCHANGE withObjcet:_buttomRightBtn];
    
    // Do any additional setup after loading the view.
}

- (IBAction)buttomLeftBtnClick:(id)sender {
    [self tel];
}
- (IBAction)buttomRightBtnClick:(id)sender {
    
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SCREENHEIGHT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        ScheduleDetailUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ScheduleDetailUpTableViewCell"];
        if (cell == nil) {
            cell = [[ScheduleDetailUpTableViewCell alloc] init];
        }
        
        cell.delegate = self;
        cell.upBackgroundImg.image = _upImg;
        
        [cell.upScrollView setContentSize:CGSizeMake(320 * HEIGHTCHANGE, (_upHeight - 1) * HEIGHTCHANGE)];
        cell.upScrollView.frame = CGRectMake(0, 0, SCREENWIDTH ,SCREENHEIGHT);
        if (_isUpFirstReload) {
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.upBackgroundImg];
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.backBtn];
            _isUpFirstReload = NO;
        }
        
        
        return cell;
    }
    else {
        ScheduleDetailButtomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ScheduleDetailButtomTableViewCell"];
        if (cell == nil) {
            cell = [[ScheduleDetailButtomTableViewCell alloc] init];
        }
        
        cell.delegate = self;
        cell.buttomBackgroundImg.image = _downImg;
        [cell.buttomScrollView setContentSize:CGSizeMake(320 * HEIGHTCHANGE, _downHeight * HEIGHTCHANGE)];
        cell.buttomScrollView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
        
        if (_isButtomFirstReload) {
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.buttomBackgroundImg];
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.scrollLeftBtn];
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.middleScrollView];
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.scrollRightBtn];
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.moreWorkBtn];
            _isButtomFirstReload = NO;
        }
        
        return cell;
    }
}

#pragma mark - ScheduleDetailUpTableViewCellDelegate

- (void)scrollDown:(CGFloat)yOff {
    if (yOff <= 0) {
        return;
    }
    if (yOff >= _upHeight * HEIGHTCHANGE - SCREENHEIGHT + 50) {
        [_mainTableView setContentOffset:CGPointMake(0, SCREENHEIGHT) animated:YES];
    }
}

- (void)scheduleDetailUpBackBtnClick {
    [self backBtnClick];
}

- (void)buttomViewChangeFrame:(CGFloat)yOff withHeightChange:(CGFloat)heightChange {
    if (heightChange > 0) {
        if (yOff > (_upHeight - 62) * HEIGHTCHANGE - SCREENHEIGHT &&  _buttomView.frame.origin.y > SCREENHEIGHT - 62 * HEIGHTCHANGE) {
            _buttomView.frame = CGRectMake(_buttomView.frame.origin.x, _buttomView.frame.origin.y - heightChange, _buttomView.frame.size.width, _buttomView.frame.size.height);
            if (_buttomView.frame.origin.y < SCREENHEIGHT - 62 * HEIGHTCHANGE) {
                [UIView animateWithDuration:0.001 animations:^{
                    _buttomView.frame = CGRectMake(_buttomView.frame.origin.x, SCREENHEIGHT - _buttomView.frame.size.height, _buttomView.frame.size.width, _buttomView.frame.size.height);
                }];
            }
        }
    }
    else {
        if (yOff < _upHeight * HEIGHTCHANGE - SCREENHEIGHT && _buttomView.frame.origin.y < SCREENHEIGHT) {
            _buttomView.frame = CGRectMake(_buttomView.frame.origin.x, _buttomView.frame.origin.y - heightChange, _buttomView.frame.size.width, _buttomView.frame.size.height);
            if (_buttomView.frame.origin.y < SCREENHEIGHT - 62 * HEIGHTCHANGE) {
                [UIView animateWithDuration:0.001 animations:^{
                    _buttomView.frame = CGRectMake(_buttomView.frame.origin.x, SCREENHEIGHT - _buttomView.frame.size.height, _buttomView.frame.size.width, _buttomView.frame.size.height);
                }];
            }
            
        }
    }
}

#pragma mark - ScheduleDetailButtomTableViewCellDelegate

- (void)scrollUp:(CGFloat)yOff {
    if (yOff < -50) {
        
        [_mainTableView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}

- (void)moreWorkBtnClick {
    MorePostViewController *vc = [[UIStoryboard storyboardWithName:@"Merchant" bundle:nil] instantiateViewControllerWithIdentifier:@"MorePostViewController"];
    if (vc == nil) {
        vc = [[MorePostViewController alloc] init];
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
