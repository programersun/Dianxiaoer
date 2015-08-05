//
//  MerchanBidMainViewController.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/5.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MerchanBidMainViewController.h"
#import "MerchanBidUPTableViewCell.h"
#import "MerchanBidButtomTableViewCell.h"
#import "ShareView.h"
#import "SubmitChooseDay.h"
#import "MorePostViewController.h"

@interface MerchanBidMainViewController () <UITableViewDataSource,UITableViewDelegate,MerchanBidButtomTableViewCellDelegate,MerchanBidUPTableViewCellDelegate>

@property (nonatomic, strong) SubmitChooseDay *submitChooseDay;
@property (nonatomic, strong) ShareView *shareView;

@property UIImage *upImg;
@property UIImage *downImg;
@property CGFloat upHeight;
@property CGFloat downHeight;
@property BOOL isUpFirstReload;
@property BOOL isButtomFirstReload;

@end

@implementation MerchanBidMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _upImg = [UIImage imageNamed:@"MerchantBidTop"];
    _upHeight = _upImg.size.height;
    _downImg = [UIImage imageNamed:@"MerchantBidBottom"];
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
//    if (indexPath.row == 0) {
//        return _upHeight * HEIGHTCHANGE;
//    }
//    else {
//        return _downHeight * HEIGHTCHANGE;
//    }
    return SCREENHEIGHT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        MerchanBidUPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MerchanBidUPTableViewCell"];
        if (cell == nil) {
            cell = [[MerchanBidUPTableViewCell alloc] init];
        }
        
        cell.delegate = self;
        cell.upBackgroundImg.image = _upImg;
        
        [cell.upScrollView setContentSize:CGSizeMake(320 * HEIGHTCHANGE, (_upHeight - 1) * HEIGHTCHANGE)];
        cell.upScrollView.frame = CGRectMake(0, 0, SCREENWIDTH ,SCREENHEIGHT);
        
        if (_isUpFirstReload) {
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.upBackgroundImg];
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.backBtn];
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.shareBtn];
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.moreDaysBtn];
            _isUpFirstReload = NO;
        }
        
        
        return cell;
    }
    else {
        MerchanBidButtomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MerchanBidButtomTableViewCell"];
        if (cell == nil) {
            cell = [[MerchanBidButtomTableViewCell alloc] init];
        }
        
        cell.delegate = self;
        [cell.buttomScrollView setContentSize:CGSizeMake(320 * HEIGHTCHANGE, _downHeight * HEIGHTCHANGE)];
        cell.buttomScrollView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
        cell.downBackgroundImg.image = _downImg;
        
        if (_isButtomFirstReload) {
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.downBackgroundImg];
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.scrollLeftBtn];
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.middleScrollView];
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.scrollRightBtn];
            [self changeFrame:HEIGHTCHANGE withObjcet:cell.moreWorkBtn];
            _isButtomFirstReload = NO;
        }
        
        return cell;
    }
}

#pragma mark - MerchanBidUPTableViewCellDelegate

- (void)scrollDown:(CGFloat)yOff {
    if (yOff <= 0) {
        return;
    }
    if (yOff >= 262) {
        [_mainTableView setContentOffset:CGPointMake(0, SCREENHEIGHT) animated:YES];
    }
}

- (void)bickBtnClick {
    [self bickBtnClick];
}

- (void)shareBtnClick {
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

#pragma mark - MerchanBidButtomTableViewCellDelegate

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
