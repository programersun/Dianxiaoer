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
#import "MainMiddleTableViewCell.h"
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
#import "MerchanBidMainViewController.h"
#import "MerchantInfoViewController.h"
#import "TaskMainViewController.h"
#import "AssistantMainViewController.h"
#import "IncomeViewController.h"
#import "ScheduleViewController.h"
#import "mainTableViewFooterView.h"
#import "ReleaseViewController.h"
#import "MainNewHeaderView.h"
#import "MainNewTableViewCell.h"

@interface MainViewController () <UITableViewDelegate,UITableViewDataSource ,UIGestureRecognizerDelegate,MainBannerTableViewCellDelegate ,MenuViewDelegate,SearchAlertDelegate,TodayTopViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *orderBtn;
@property (weak, nonatomic) IBOutlet UIView *todayTopView;
@property (weak, nonatomic) IBOutlet UIButton *menuBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *orderBtnTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topVIewTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *orderBtnHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *orderBtnWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuBtnHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuBtnWidth;

@property (weak, nonatomic) IBOutlet UIButton *mainTabBtn;
@property (weak, nonatomic) IBOutlet UIButton *taskTabBtn;
@property (weak, nonatomic) IBOutlet UIButton *purseTabBtn;
@property (weak, nonatomic) IBOutlet UIView *tabBarAppearView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewButtom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tabBarAppearViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tabBarViewButtom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tabBarViewHeight;


@property (weak, nonatomic) IBOutlet UIView *tabBarView;



@property (nonatomic, strong) MenuView *menuView;
@property (nonatomic, strong) SearchAlert *searchAlert;

@property (nonatomic, strong) UISwipeGestureRecognizer *topDown;
@property (nonatomic, strong) UISwipeGestureRecognizer *topUp;
@property (nonatomic, strong) UITapGestureRecognizer *headTouch;

@property (assign, nonatomic) CGFloat screenWidth;
@property (assign, nonatomic) CGFloat screenHeight;
@property (assign, nonatomic) CGFloat oldcontentOffsetY;
//@property NSArray *tabBarTypeArray;
@property BOOL tabBarHidden;
@property BOOL tabBarAppear;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.hidden = YES;
    self.mainTableView.delegate = self;
    _screenWidth  = [UIScreen mainScreen].bounds.size.width;
    _screenHeight = [UIScreen mainScreen].bounds.size.height;
//    [self addDownPanToTopView];
    _topVIewTop.constant = 0;
    _orderBtnTop.constant = -(_screenWidth/2 + 10 * HEIGHTCHANGE);
    _orderBtnWidth.constant = _orderBtnWidth.constant * HEIGHTCHANGE;
    _orderBtnHeight.constant = _orderBtnHeight.constant * HEIGHTCHANGE;
    
    _menuBtnWidth.constant = _menuBtnWidth.constant * HEIGHTCHANGE;
    _menuBtnHeight.constant = _menuBtnHeight.constant * HEIGHTCHANGE;
    
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
    
    [_mainTabBtn setImage:[UIImage imageNamed:@"mainTabSelect"] forState:UIControlStateNormal];
    [_taskTabBtn setImage:[UIImage imageNamed:@"taskTab"] forState:UIControlStateNormal];
    [_purseTabBtn setImage:[UIImage imageNamed:@"purseTab"] forState:UIControlStateNormal];
}

- (IBAction)tabBarAppearBtnClick:(id)sender {
    _tableViewButtom.constant = 49 * HEIGHTCHANGE;
    _tabBarViewButtom.constant = 0;
}

- (IBAction)mainTabBtnClick:(id)sender {
    
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
    if ([self needLogin]) {
        [self toLoginVC];
    }
    else {
        UINavigationController *nav = [[UIStoryboard storyboardWithName:@"NewInCome" bundle:nil] instantiateViewControllerWithIdentifier:@"NewInComeNav"];
        if (nav == nil) {
            nav = [[UINavigationController alloc] init];
        }
        self.view.window.rootViewController = nav;
    }
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
    _searchAlert.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self changeFrame:SCREENWIDTH/320 withObjcet:_searchAlert.backgroundView];
    [self changeFrame:SCREENWIDTH/320 withObjcet:_searchAlert.cancelBtn];
    [self changeFrame:SCREENWIDTH/320 withObjcet:_searchAlert.submitBtn];
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
    _menuView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
//    _menuView.menuBtnWidth.constant = _menuView.menuBtnWidth.constant * HEIGHTCHANGE;
//    _menuView.menuBtnHeight.constant = _menuView.menuBtnHeight.constant * HEIGHTCHANGE;
    [_menuView changeLayOut];
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
            _todayTopView.frame = CGRectMake(0, 0, _screenWidth, 0);
            _todayTopView.alpha = 0;
        }];
    }
}

- (void)todayTopViewAppear {
    _todayTopView.frame = CGRectMake(0, 0, _screenWidth, 0);
    _todayTopView.alpha = 0;
    [UIView animateWithDuration:1.0 animations:^{
        _todayTopView.frame = CGRectMake(0, 0, _screenWidth, _screenHeight);
        _todayTopView.alpha = 0.95;
    }];
    
    _topUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(todayTopViewUp)];
    [_topUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [_todayTopView addGestureRecognizer:_topUp];
}

#pragma mark - MainBannerTableViewCellDelegate

- (void)bannerTouch {
    AssistantMainViewController *vc = [[UIStoryboard storyboardWithName:@"Assistant" bundle:nil] instantiateViewControllerWithIdentifier:@"AssistantMainViewController"];
    if (vc == nil) {
        vc = [[AssistantMainViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

#pragma mark - TodayTopViewDelegate

- (void)todayTopMenuBtnClick {
    [_todayTopView removeFromSuperview];
    [self backgroudViewAppear];
}

#pragma mark - SearchAlertDelegate

- (void)toRootVC {
    [_searchAlert removeFromSuperview];
}

#pragma mark - MenuViewDelegate

- (void)toMessageVC {
    if ([self needLogin]) {
        [self toLoginVC];
    }
    else {
        
        ReleaseViewController *vc = [[UIStoryboard storyboardWithName:@"Release" bundle:nil] instantiateViewControllerWithIdentifier:@"ReleaseViewController"];
        if (vc == nil) {
            vc = [[ReleaseViewController alloc] init];
        }
        [[self navigationController] pushViewController:vc animated:YES];

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

#pragma mark - UITableViewDelegate,UITableViewDataSource ,UIGestureRecognizerDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return [UIScreen mainScreen].bounds.size.width / 2;
    }
    else {
        return 134 * HEIGHTCHANGE;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 2) {
        return 30;
    }
    else {
        return 0.00001;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 2) {
        UINib *nib = [UINib nibWithNibName:@"mainTableViewFooterView" bundle:nil];
        mainTableViewFooterView *view = [nib instantiateWithOwner:nil options:nil][0];
        return view;
    }
    else {
        return nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    else {
        return 10;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section > 0) {
//        UINib *nib = [UINib nibWithNibName:@"MainHeaderCellView" bundle:nil];
//        MainHeaderCellView *view = [nib instantiateWithOwner:nil options:nil][0];
//        view.headerMidImgHeight.constant = view.headerMidImgHeight.constant * HEIGHTCHANGE;
//        view.headerMidImgWidth.constant = view.headerMidImgWidth.constant * HEIGHTCHANGE;
//        return view;
        UINib *nib = [UINib nibWithNibName:@"MainNewHeaderView" bundle:nil];
        MainNewHeaderView *view = [nib instantiateWithOwner:nil options:nil][0];
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
//        return 70;
        return 46 * HEIGHTCHANGE;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    _headTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImgTouch)];
    if (indexPath.section == 0) {
        MainBannerTableViewCell *bannerCell = [tableView dequeueReusableCellWithIdentifier:@"bannerCell"];
        if (bannerCell == nil) {
            bannerCell = [[MainBannerTableViewCell alloc] init];
        }
        bannerCell.bannerCollectionView.frame = CGRectMake(0, 0, _screenWidth, _screenWidth/2);
        bannerCell.bannerPageConrtol.frame = CGRectMake(_screenWidth/2 -bannerCell.bannerPageConrtol.frame.size.width/2 , _screenWidth/2 - bannerCell.bannerPageConrtol.frame.size.height, bannerCell.bannerPageConrtol.frame.size.width, bannerCell.bannerPageConrtol.frame.size.height);
        bannerCell.delegate = self;
        [bannerCell startLoadDataBanner];
        return bannerCell;
    }
    else {
        
        MainNewTableViewCell *mainNewCell = [tableView dequeueReusableCellWithIdentifier:@"MainNewTableViewCell"];
        if (mainNewCell == nil) {
            mainNewCell = [[MainNewTableViewCell alloc] init];
        }
//        mainMiddleCell.headImg.image = [UIImage imageNamed:@"shopHeadImg"];
//        mainMiddleCell.headImg.layer.cornerRadius = mainMiddleCell.headImg.frame.size.width / 1.5;
//        mainMiddleCell.headImg.layer.masksToBounds = YES;
//        [mainMiddleCell.headImg addGestureRecognizer:_headTouch];
        [mainNewCell.mainNewCellHeadImg addGestureRecognizer:_headTouch];
        mainNewCell.mainNewCellHeadImgLeft.constant = 51 * HEIGHTCHANGE;
        return mainNewCell;
        
//        MainLeftTableViewCell *mainLeftCell = [tableView dequeueReusableCellWithIdentifier:@"mainLeftCell"];
//        if (mainLeftCell == nil) {
//            mainLeftCell = [[MainLeftTableViewCell alloc] init];
//        }
//        mainLeftCell.headImg.image = [UIImage imageNamed:@"shopHeadImg"];
//        mainLeftCell.headImg.layer.cornerRadius = mainLeftCell.headImg.frame.size.width / 1.5;
//        mainLeftCell.headImg.layer.masksToBounds = YES;
//        [mainLeftCell.headImg addGestureRecognizer:_headTouch];
//        return mainLeftCell;
//        MainMiddleTableViewCell *mainMiddleCell = [tableView dequeueReusableCellWithIdentifier:@"MainMiddleTableViewCell"];
//        if (mainMiddleCell == nil) {
//            mainMiddleCell = [[MainMiddleTableViewCell alloc] init];
//        }
//        mainMiddleCell.headImg.image = [UIImage imageNamed:@"shopHeadImg"];
//        mainMiddleCell.headImg.layer.cornerRadius = mainMiddleCell.headImg.frame.size.width / 1.5;
//        mainMiddleCell.headImg.layer.masksToBounds = YES;
//        [mainMiddleCell.headImg addGestureRecognizer:_headTouch];
//        return mainMiddleCell;
    }
//    else if (indexPath.row % 2 == 0) {
//        MainLeftTableViewCell *mainLeftCell = [tableView dequeueReusableCellWithIdentifier:@"mainLeftCell"];
//        if (mainLeftCell == nil) {
//            mainLeftCell = [[MainLeftTableViewCell alloc] init];
//        }
//        mainLeftCell.headImg.image = [UIImage imageNamed:@"shopHeadImg"];
//        mainLeftCell.headImg.layer.cornerRadius = mainLeftCell.headImg.frame.size.width / 2;
//        mainLeftCell.headImg.layer.masksToBounds = YES;
//        [mainLeftCell.headImg addGestureRecognizer:_headTouch];
//        return mainLeftCell;
//    }
//    else {
//        MainRightTableViewCell *mainRightCell = [tableView dequeueReusableCellWithIdentifier:@"mainRightCell"];
//        if (mainRightCell == nil) {
//            mainRightCell = [[MainRightTableViewCell alloc] init];
//        }
//        mainRightCell.headImg.image = [UIImage imageNamed:@"shopHeadImg"];
//        mainRightCell.headImg.layer.cornerRadius = mainRightCell.headImg.frame.size.width / 2;
//        mainRightCell.headImg.layer.masksToBounds = YES;
//        [mainRightCell.headImg addGestureRecognizer:_headTouch];
//        return mainRightCell;
//    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
        MerchanBidMainViewController *vc = [[UIStoryboard storyboardWithName:@"Merchant" bundle:nil] instantiateViewControllerWithIdentifier:@"MerchanBidMainViewController"];
        if (vc == nil) {
            vc = [[MerchanBidMainViewController alloc] init];
        }
        [[self navigationController] pushViewController:vc animated:YES];
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
        if (newcontentOffsetY + _screenHeight < scrollView.contentSize.height) {
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
        if (newcontentOffsetY < _screenWidth / 2) {
            _orderBtnTop.constant = -(_screenWidth / 2 + 10 * HEIGHTCHANGE - newcontentOffsetY);
        }
        else {
            _orderBtnTop.constant = -10 * HEIGHTCHANGE;
        }
        
    }
    else {
        _topVIewTop.constant = 0;
        _orderBtnTop.constant = -(_screenWidth / 2 + 10 * HEIGHTCHANGE - newcontentOffsetY);
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
