//
//  MainViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/15.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MainViewController.h"
#import "MainBannerCollectionViewCell.h"
#import "MainBannerTableViewCell.h"
#import "MainLeftTableViewCell.h"
#import "MainRightTableViewCell.h"
#import "MainHeaderCellView.h"
#import "MyMainViewController.h"
#import "MenuView.h"
#import "LoginViewController.h"
#import "UIViewController+Category.h"
#import "SearchAlert.h"
#import "TodayTopView.h"
#import "MerchantBidViewController.h"
#import "MerchantInfoViewController.h"
#import "TaskMainViewController.h"
#import "AssistantMainViewController.h"
#import "IncomeViewController.h"
#import "ScheduleViewController.h"

@interface MainViewController () <UITableViewDelegate,UITableViewDataSource ,UIGestureRecognizerDelegate,MainBannerTableViewCellDelegate ,MenuViewDelegate,SearchAlertDelegate,TodayTopViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *orderBtn;
@property (weak, nonatomic) IBOutlet UIView *todayTopView;

@property (nonatomic, strong) MenuView *menuView;
@property (nonatomic, strong) SearchAlert *searchAlert;

@property (nonatomic, strong) UISwipeGestureRecognizer *topDown;
@property (nonatomic, strong) UISwipeGestureRecognizer *topUp;
@property (nonatomic, strong) UITapGestureRecognizer *headTouch;

@property (assign, nonatomic) CGFloat screenWidth;
@property (assign, nonatomic) CGFloat screenHeight;
@property (assign, nonatomic) CGFloat oldcontentOffsetY;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBarHidden = YES;
    self.mainTableView.delegate = self;
    _screenWidth  = [UIScreen mainScreen].bounds.size.width;
    _screenHeight = [UIScreen mainScreen].bounds.size.height;
    [self addDownPanToTopView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftBtnClick:(id)sender {
    if ([self needLogin]) {
        [self toLoginVC];
    }
    else {
        MyMainViewController *myMianVC = [[UIStoryboard storyboardWithName:@"My" bundle:nil] instantiateViewControllerWithIdentifier:@"MyMainViewController"];
        if (myMianVC == nil) {
            myMianVC = [[MyMainViewController alloc] init];
        }
        [[self navigationController] pushViewController:myMianVC animated:YES];
    }
}

- (IBAction)searchBtnClick:(id)sender {
    UINib *nib = [UINib nibWithNibName:@"SearchAlert" bundle:nil];
    _searchAlert = [nib instantiateWithOwner:nil options:nil][0];
    _searchAlert.delegate = self;
    [self.view addSubview:_searchAlert];
}

- (IBAction)orderBtnClick:(id)sender {
    if ([self needLogin]) {
        [self toLoginVC];
    }
    else {
        TaskMainViewController *vc = [[UIStoryboard storyboardWithName:@"Task" bundle:nil] instantiateViewControllerWithIdentifier:@"TaskMainViewController"];
        if (vc == nil) {
            vc = [[TaskMainViewController alloc] init];
        }
        [[self navigationController] pushViewController:vc animated:YES];
    }
}

- (IBAction)menuBtnClick:(id)sender {
    [self backgroudViewAppear];
}

- (void)headImgTouch {
    if ([self needLogin]) {
        [self toLoginVC];
    }
    else {
        MerchantInfoViewController *myMianVC = [[UIStoryboard storyboardWithName:@"Merchant" bundle:nil] instantiateViewControllerWithIdentifier:@"MerchantInfoViewController"];
        if (myMianVC == nil) {
            myMianVC = [[MerchantInfoViewController alloc] init];
        }
        [[self navigationController] pushViewController:myMianVC animated:YES];
    }
}

- (void)backgroudViewAppear {
    UINib *nib = [UINib nibWithNibName:@"MenuView" bundle:nil];
    _menuView = [nib instantiateWithOwner:nil options:nil][0];
    UITapGestureRecognizer *backTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundViewDisappear)];
    [_menuView addGestureRecognizer:backTouch];
    _menuView.delegate = self;
    [self.view addSubview:_menuView];
}

- (void)backgroundViewDisappear {
    [_menuView removeFromSuperview];
}

//给顶部View增加向下滑动手势
- (void)addDownPanToTopView {
    _topDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(todayTopViewDown)];
    [_topDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [_topView addGestureRecognizer:_topDown];
}

- (void)todayTopViewDown {
    if (_topDown.state == UIGestureRecognizerStateEnded ) {
        [self todayTopViewAppear];
    }
}

- (void)todayTopViewUp {
    if (_topUp.state == UIGestureRecognizerStateEnded ) {
        [UIView animateWithDuration:1.0 animations:^{
            _todayTopView.frame = CGRectMake(0, -568, 320, 568);
            _todayTopView.alpha = 0;
        }];
    }
}

- (void)todayTopViewAppear {
    _todayTopView.frame = CGRectMake(0, -568, 320, 568);
    _todayTopView.alpha = 0;
    [UIView animateWithDuration:1.0 animations:^{
        _todayTopView.frame = CGRectMake(0, 0, 320, 568);
        _todayTopView.alpha = 0.95;
    }];
    
    _topUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(todayTopViewUp)];
    [_topUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [_todayTopView addGestureRecognizer:_topUp];
}

#pragma MARK: MainBannerTableViewCellDelegate

- (void)bannerTouch {
    AssistantMainViewController *vc = [[UIStoryboard storyboardWithName:@"Assistant" bundle:nil] instantiateViewControllerWithIdentifier:@"AssistantMainViewController"];
    if (vc == nil) {
        vc = [[AssistantMainViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

#pragma MARK: TodayTopViewDelegate

- (void)todayTopMenuBtnClick {
    [_todayTopView removeFromSuperview];
    [self backgroudViewAppear];
}

#pragma MARK: SearchAlertDelegate

- (void)toRootVC {
    [_searchAlert removeFromSuperview];
}

#pragma MARK: MenuViewDelegate

- (void)toMessageVC {
    if ([self needLogin]) {
        [self toLoginVC];
    }
    else {
        
//        TaskMainViewController *vc = [[UIStoryboard storyboardWithName:@"Task" bundle:nil] instantiateViewControllerWithIdentifier:@"TaskMainViewController"];
//        if (vc == nil) {
//            vc = [[TaskMainViewController alloc] init];
//        }
//        [[self navigationController] pushViewController:vc animated:YES];
    }
}

- (void)toAccountVC {
    if ([self needLogin]) {
        [self toLoginVC];
    }
    else {
        IncomeViewController *vc = [[UIStoryboard storyboardWithName:@"Income" bundle:nil] instantiateViewControllerWithIdentifier:@"IncomeViewController"];
        if (vc == nil) {
            vc = [[IncomeViewController alloc] init];
        }
        [[self navigationController] pushViewController:vc animated:YES];
    }
}

- (void)toDateVC {
    if ([self needLogin]) {
        [self toLoginVC];
    }
    else {
        ScheduleViewController *vc = [[UIStoryboard storyboardWithName:@"Schedule" bundle:nil] instantiateViewControllerWithIdentifier:@"ScheduleViewController"];
        if (vc == nil) {
            vc = [[ScheduleViewController alloc] init];
        }
        [[self navigationController] pushViewController:vc animated:YES];
    }
}

#pragma MARK: UITableViewDelegate,UITableViewDataSource ,UIGestureRecognizerDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return [UIScreen mainScreen].bounds.size.width / 2;
    }
    else {
        return 130;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else {
        return 5;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section > 0) {
        UINib *nib = [UINib nibWithNibName:@"MainHeaderCellView" bundle:nil];
        MainHeaderCellView *view = [nib instantiateWithOwner:nil options:nil][0];
        return view;
    }
    else {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    else {
        return 70;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    _headTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImgTouch)];
    if (indexPath.section == 0) {
        MainBannerTableViewCell *bannerCell = [tableView dequeueReusableCellWithIdentifier:@"bannerCell"];
        if (bannerCell == nil) {
            bannerCell = [[MainBannerTableViewCell alloc] init];
        }
        bannerCell.delegate = self;
        [bannerCell startLoadDataBanner];
        return bannerCell;
    }
    else if (indexPath.row % 2 == 0) {
        MainLeftTableViewCell *mainLeftCell = [tableView dequeueReusableCellWithIdentifier:@"mainLeftCell"];
        if (mainLeftCell == nil) {
            mainLeftCell = [[MainLeftTableViewCell alloc] init];
        }
        mainLeftCell.headImg.image = [UIImage imageNamed:@"shopHeadImg"];
        mainLeftCell.headImg.layer.cornerRadius = mainLeftCell.headImg.frame.size.width / 2;
        mainLeftCell.headImg.layer.masksToBounds = YES;
        [mainLeftCell.headImg addGestureRecognizer:_headTouch];
        return mainLeftCell;
    }
    else {
        MainRightTableViewCell *mainRightCell = [tableView dequeueReusableCellWithIdentifier:@"mainRightCell"];
        if (mainRightCell == nil) {
            mainRightCell = [[MainRightTableViewCell alloc] init];
        }
        mainRightCell.headImg.image = [UIImage imageNamed:@"shopHeadImg"];
        mainRightCell.headImg.layer.cornerRadius = mainRightCell.headImg.frame.size.width / 2;
        mainRightCell.headImg.layer.masksToBounds = YES;
        [mainRightCell.headImg addGestureRecognizer:_headTouch];
        return mainRightCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    if ([self needLogin]) {
//        [self toLoginVC];
//    }
//    else {
        MerchantBidViewController *vc = [[UIStoryboard storyboardWithName:@"Merchant" bundle:nil] instantiateViewControllerWithIdentifier:@"MerchantBidViewController"];
        if (vc == nil) {
            vc = [[MerchantBidViewController alloc] init];
        }
        [[self navigationController] pushViewController:vc animated:YES];
//    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _oldcontentOffsetY = scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat newcontentOffsetY = scrollView.contentOffset.y;
    CGFloat heightChange = newcontentOffsetY - _oldcontentOffsetY;

    if (newcontentOffsetY > 0) {
        if (newcontentOffsetY + _screenHeight < scrollView.contentSize.height) {
            if (heightChange > 0) {
                
                if (_topView.frame.origin.y > -64 && _topView.frame.origin.y - heightChange >= -64) {
                    _topView.hidden = NO;
                    _topView.frame = CGRectMake(0, _topView.frame.origin.y - heightChange, _topView.frame.size.width, _topView.frame.size.height);
                    _mainTableView.frame = CGRectMake(0, _mainTableView.frame.origin.y - heightChange, _screenWidth, _screenHeight);
                }
                else {
                    _topView.frame = CGRectMake(0, -64, _topView.frame.size.width, _topView.frame.size.height);
                    _mainTableView.frame = CGRectMake(0, 0, _screenWidth, _screenHeight);
                }
            }
            else {
                if (_topView.frame.origin.y < 0 && _topView.frame.origin.y - heightChange <= 0) {
                    _topView.hidden = NO;
                    _topView.frame = CGRectMake(0, _topView.frame.origin.y - heightChange, _topView.frame.size.width, _topView.frame.size.height);
                    _mainTableView.frame = CGRectMake(0, _mainTableView.frame.origin.y - heightChange, _screenWidth, _screenHeight);
                }
                else {
                    _topView.frame = CGRectMake(0, 0, _topView.frame.size.width, _topView.frame.size.height);
                    _mainTableView.frame = CGRectMake(0, 64, _screenWidth, _screenHeight);
                }
                
            }
        }
        else {
            _topView.hidden = YES;
            _mainTableView.frame = CGRectMake(0, 0, _screenWidth, _screenHeight);
        }
        if (newcontentOffsetY < 160) {
            _orderBtn.frame = CGRectMake(_orderBtn.frame.origin.x, _mainTableView.frame.origin.y + 182 - newcontentOffsetY, _orderBtn.frame.size.width, _orderBtn.frame.size.height);
        }
        else {
            _orderBtn.frame = CGRectMake(_orderBtn.frame.origin.x, _mainTableView.frame.origin.y + 20, _orderBtn.frame.size.width, _orderBtn.frame.size.height);
        }
    }
    else {
        _topView.hidden = NO;
        _mainTableView.frame = CGRectMake(0, 64, _screenWidth, _screenHeight);
        _topView.frame = CGRectMake(0, 0, _topView.frame.size.width, _topView.frame.size.height);
        _orderBtn.frame = CGRectMake(_orderBtn.frame.origin.x, _mainTableView.frame.origin.y + 182 - newcontentOffsetY, _orderBtn.frame.size.width, _orderBtn.frame.size.height);
    }

    _oldcontentOffsetY = newcontentOffsetY;
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
