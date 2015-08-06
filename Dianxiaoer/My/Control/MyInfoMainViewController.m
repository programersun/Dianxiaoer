//
//  MyInfoMainViewController.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/6.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MyInfoMainViewController.h"
#import "MyInfoMainTopTableViewCell.h"
#import "MyInfoMainButtomTableViewCell.h"

@interface MyInfoMainViewController () <UITableViewDataSource,UITableViewDelegate,MyInfoMainButtomTableViewCellDelegate,MyInfoMainTopTableViewCellDelegate>

@property UIImage *upImg;
@property UIImage *downImg;
@property CGFloat upHeight;
@property CGFloat downHeight;
@property BOOL isUpFirstReload;
@property BOOL isButtomFirstReload;

@end

@implementation MyInfoMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _upImg = [UIImage imageNamed:@"myInfoTop"];
    _upHeight = _upImg.size.height;
    _downImg = [UIImage imageNamed:@"myInfoButtom"];
    _downHeight = _downImg.size.height;
    _mainTableView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    _isUpFirstReload = YES;
    _isButtomFirstReload = YES;
    
    // Do any additional setup after loading the view.
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
        MyInfoMainTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyInfoMainTopTableViewCell"];
        if (cell == nil) {
            cell = [[MyInfoMainTopTableViewCell alloc] init];
        }
        
        cell.delegate = self;
        cell.upBackgroundView.image = _upImg;
        
        [cell.upScrollView setContentSize:CGSizeMake(320 * HEIGHTCHANGE, (_upHeight - 1) * HEIGHTCHANGE)];
        cell.upScrollView.frame = CGRectMake(0, 0, SCREENWIDTH ,SCREENHEIGHT);
        if (_isUpFirstReload) {
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.upBackgroundView];
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.backBtn];
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.modfiyBtn];
            _isUpFirstReload = NO;
        }
        return cell;
    }
    else {
        MyInfoMainButtomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyInfoMainButtomTableViewCell"];
        if (cell == nil) {
            cell = [[MyInfoMainButtomTableViewCell alloc] init];
        }
        
        cell.delegate = self;
        cell.buttomBackgroundImg.image = _downImg;
        [cell.buttomScrollView setContentSize:CGSizeMake(320 * HEIGHTCHANGE, _downHeight * HEIGHTCHANGE)];
        cell.buttomScrollView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
        
        if (_isButtomFirstReload) {
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.buttomBackgroundImg];
            _isButtomFirstReload = NO;
        }
        return cell;
    }
}

#pragma mark - MyInfoMainTopTableViewCellDelegate

- (void)scrollDown:(CGFloat)yOff {
    if (yOff <= 0) {
        return;
    }
    if (yOff >= _upHeight * HEIGHTCHANGE - SCREENHEIGHT + 100) {
        [_mainTableView setContentOffset:CGPointMake(0, SCREENHEIGHT) animated:YES];
    }
}

- (void)myInfoBackBtnClick {
    [self backBtnClick];
}

- (void)modfiyBtnClick {

}

#pragma mark - MyInfoMainButtomTableViewCellDelegate

- (void)scrollUp:(CGFloat)yOff {
    if (yOff < -100) {
        
        [_mainTableView setContentOffset:CGPointMake(0, 0) animated:YES];
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
