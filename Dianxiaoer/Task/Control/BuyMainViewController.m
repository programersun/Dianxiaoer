//
//  BuyMainViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/23.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "BuyMainViewController.h"
#import "BuyCollectionViewCell.h"
#import "HWViewPager.h"
#import "MerchantInfoViewController.h"
#import "ChooseDay.h"
#import "SubmitChooseDay.h"
#import "ModifyView.h"
#import "SubmitSuccessViewController.h"
#import "ReleaseViewController.h"

@interface BuyMainViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate,HWViewPagerDelegate,BuyCollectionViewCellDelegate,SubmitChooseDayDelegate,ModifyViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *buyButtomImg;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
@property (weak, nonatomic) IBOutlet UIButton *leftOpenBtn;
@property (weak, nonatomic) IBOutlet UIButton *leftCloseBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *modifyBtn;

@property (nonatomic, strong) ChooseDay *chooseDayView;
@property (nonatomic, strong) SubmitChooseDay *submitChooseDay;
@property (nonatomic, strong) ModifyView *modifyView;

@end

@implementation BuyMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _submitBtn.hidden = NO;
    _leftOpenBtn.hidden = NO;
    _leftCloseBtn.hidden = YES;
    _deleteBtn.hidden = YES;
    _modifyBtn.hidden = YES;
    _buyButtomImg.image = [UIImage imageNamed:@"buyButtom01"];

    // Do any additional setup after loading the view.
}
- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)submitBtnClick:(id)sender {
    [self submitChooseViewAppear];
}

#pragma mark - SubmitChooseDayDelegate

- (void)submitChooseDayBtnClick {
    SubmitSuccessViewController *vc = [[UIStoryboard storyboardWithName:@"TaskBuy" bundle:nil] instantiateViewControllerWithIdentifier:@"SubmitSuccessViewController"];
    if (vc == nil) {
        vc = [[SubmitSuccessViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

- (void)submitChooseViewAppear {
    UINib *nib = [UINib nibWithNibName:@"SubmitChooseDay" bundle:nil];
    _submitChooseDay = [nib instantiateWithOwner:nil options:nil][0];
    UITapGestureRecognizer *backTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(submitChooseViewDisappear)];
    [_submitChooseDay.backgroundImg addGestureRecognizer:backTouch];
    _submitChooseDay.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self changeFrame:SCREENWIDTH/320 withObjcet:_submitChooseDay.submitBtn];
    _submitChooseDay.delegate = self;
    [self.view addSubview:_submitChooseDay];
    
}

- (void)submitChooseViewDisappear {
    [_submitChooseDay removeFromSuperview];
}

- (IBAction)leftOpenBtnClick:(id)sender {
    _submitBtn.hidden = YES;
    _leftOpenBtn.hidden = YES;
    _leftCloseBtn.hidden = NO;
    _deleteBtn.hidden = NO;
    _modifyBtn.hidden = NO;
    _buyButtomImg.image = [UIImage imageNamed:@"buyButtom02"];
}

- (IBAction)leftCloseBtnClick:(id)sender {
    _submitBtn.hidden = NO;
    _leftOpenBtn.hidden = NO;
    _leftCloseBtn.hidden = YES;
    _deleteBtn.hidden = YES;
    _modifyBtn.hidden = YES;
    _buyButtomImg.image = [UIImage imageNamed:@"buyButtom01"];
}

- (IBAction)deleteBtnClick:(id)sender {
    
}

- (IBAction)modifyBtnClick:(id)sender {
    [self modifyViewAppear];
}

- (void)modifyViewAppear {
    UINib *nib = [UINib nibWithNibName:@"ModifyView" bundle:nil];
    _modifyView = [nib instantiateWithOwner:nil options:nil][0];
    UITapGestureRecognizer *backTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(modifyViewDisappear)];
    [_modifyView.backgroundImg addGestureRecognizer:backTouch];
    _modifyView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self changeFrame:SCREENWIDTH/320 withObjcet:_modifyView.cancelBtn];
    [self changeFrame:SCREENWIDTH/320 withObjcet:_modifyView.submitBtn];
    _modifyView.delegate = self;
    [self.view addSubview:_modifyView];
    
}

- (void)modifyViewDisappear {
    [_modifyView removeFromSuperview];
}

#pragma mark - ModifyViewDelegate

- (void)submitBtnClick {
    ReleaseViewController *vc = [[UIStoryboard storyboardWithName:@"Release" bundle:nil] instantiateViewControllerWithIdentifier:@"ReleaseViewController"];
    if (vc == nil) {
        vc = [[ReleaseViewController alloc] init];
    }
    [[self navigationController] pushViewController:vc animated:YES];
}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BuyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BuyCollectionViewCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[BuyCollectionViewCell alloc] init];
    }

    cell.delegate = self;
    return cell;
}

#pragma mark - BuyCollectionViewCellDelegate

-(void)headImgClick {
    MerchantInfoViewController *myMianVC = [[UIStoryboard storyboardWithName:@"Merchant" bundle:nil] instantiateViewControllerWithIdentifier:@"MerchantInfoViewController"];
    if (myMianVC == nil) {
        myMianVC = [[MerchantInfoViewController alloc] init];
    }
    [[self navigationController] pushViewController:myMianVC animated:YES];
}

-(void)chooseDay {
    [self chooseViewAppear];
}

- (void)chooseViewAppear {
    UINib *nib = [UINib nibWithNibName:@"ChooseDay" bundle:nil];
    _chooseDayView = [nib instantiateWithOwner:nil options:nil][0];
    UITapGestureRecognizer *backTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseViewDisappear)];
    [_chooseDayView.backgroundImg addGestureRecognizer:backTouch];
    _chooseDayView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self changeFrame:SCREENWIDTH/320 withObjcet:_chooseDayView.cancelBtn];
    [self.view addSubview:_chooseDayView];

}

- (void)chooseViewDisappear {
    [_chooseDayView removeFromSuperview];
}

#pragma mark - HWViewPagerDelegate
-(void)pagerDidSelectedPage:(NSInteger)selectedPage{
//    NSLog(@"FistViewController, SelectedPage : %d",(int)selectedPage);
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
