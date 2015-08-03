//
//  AssistantMainViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/20.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "AssistantMainViewController.h"
#import "AssistantMainTableViewCell.h"
#import "AssistantHeaderView.h"
#import "MerchantBidViewController.h"
#import "SearchAlert.h"

@interface AssistantMainViewController () <UITableViewDataSource ,UITableViewDelegate,SearchAlertDelegate>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic, strong) SearchAlert *searchAlert;

@end

@implementation AssistantMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mainTableView.delegate = self;
    // Do any additional setup after loading the view.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
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

#pragma mark - SearchAlertDelegate
- (void)toRootVC {
    [_searchAlert removeFromSuperview];
}

#pragma mark - UITableViewDataSource ,UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 176;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
        UINib *nib = [UINib nibWithNibName:@"AssistantHeaderView" bundle:nil];
        AssistantHeaderView *view = [nib instantiateWithOwner:nil options:nil][0];
        return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AssistantMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AssistantMainTableViewCell"];
    if (cell == nil) {
        cell = [[AssistantMainTableViewCell alloc] init];
    }
    
    cell.headImg.image = [UIImage imageNamed:@"shopHeadImg"];
    cell.headImg.layer.cornerRadius = cell.headImg.frame.size.width / 2;
    cell.headImg.layer.masksToBounds = YES;
    
    cell.welfareA.layer.cornerRadius = cell.welfareA.frame.size.width / 2;
    cell.welfareA.layer.masksToBounds = YES;
    cell.welfareB.layer.cornerRadius = cell.welfareB.frame.size.width / 2;
    cell.welfareB.layer.masksToBounds = YES;
    
    
    cell.welfareB.backgroundColor = [UIColor colorWithRed:38.0/255 green:206.0/255 blue:183.0/255 alpha:1];
    cell.welfareA.backgroundColor = [UIColor colorWithRed:237.0/255 green:202.0/255 blue:17.0/255 alpha:1];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

        MerchantBidViewController *vc = [[UIStoryboard storyboardWithName:@"Merchant" bundle:nil] instantiateViewControllerWithIdentifier:@"MerchantBidViewController"];
        if (vc == nil) {
            vc = [[MerchantBidViewController alloc] init];
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
