//
//  SubmitSuccessViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/26.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "SubmitSuccessViewController.h"
#import "BidDetailHeaderView.h"
#import "BidDetialTableViewCell.h"
#import "SubmitSuccessView.h"

@interface SubmitSuccessViewController () <UITableViewDataSource,UITableViewDelegate,SubmitSuccessViewDelegate,BidDetailHeaderViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *bidDeatilTableView;

@property (strong, nonatomic) NSMutableArray *cellOpenArray;
@property (nonatomic, strong) SubmitSuccessView *submitSuccessView;

@end

@implementation SubmitSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cellOpenArray = [[NSMutableArray alloc] initWithObjects:@"0",@"0",@"0",@"0",@"0",nil];
    // Do any additional setup after loading the view.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)rightBtnClick:(id)sender {
    
}
- (IBAction)submitBtnClick:(id)sender {
    [self submitSuccessViewAppear];
}

#pragma mark - SubmitSuccessViewDelegate

- (void)submitSuccessBtnClick {
    [self toRootView];
}

- (void)telBtnClick {
    [self tel];
}

- (void)submitSuccessViewAppear {
    UINib *nib = [UINib nibWithNibName:@"SubmitSuccessView" bundle:nil];
    _submitSuccessView = [nib instantiateWithOwner:nil options:nil][0];
    _submitSuccessView.delegate = self;
    _submitSuccessView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self.view addSubview:_submitSuccessView];
    
}

- (void)submitSuccessViewDisappear {
    [_submitSuccessView removeFromSuperview];
}

#pragma mark - BidDetailHeaderViewDelegate

- (void)bidDetailHeaderClick:(UIButton *)sender {
    for (int i = 0; i < 5 ; i++) {
        if (sender.tag == 100 + i && [[_cellOpenArray objectAtIndex:i] isEqualToString:@"0"]) {
            [_cellOpenArray replaceObjectAtIndex:i withObject:@"1"];
        }
        else {
            [_cellOpenArray replaceObjectAtIndex:i withObject:@"0"];
        }
    }
    [UIView animateWithDuration:1.0 animations:^{
        [_bidDeatilTableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 59;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 59;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([[_cellOpenArray objectAtIndex:section] isEqualToString:@"1"]) {
        switch (section) {
            case 0:
                return 0;
                break;
            case 1:
                return 0;
                break;
            case 2:
                return 0;
                break;
            case 3:
                return 1;
                break;
            case 4:
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
    UINib *nib = [UINib nibWithNibName:@"BidDetailHeaderView" bundle:nil];
    BidDetailHeaderView *view = [nib instantiateWithOwner:nil options:nil][0];
    NSString *bidDetailHeaderImgName = [[NSString alloc] initWithFormat:@"BidDetailHeaderImg0%ld",(long)section];
    view.delegate = self;
    view.headerImg.image = [UIImage imageNamed:bidDetailHeaderImgName];
    view.bidHeaderBtn.tag = 100 + section;
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BidDetialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BidDetialTableViewCell"];
    if (cell == nil) {
        cell = [[BidDetialTableViewCell alloc] init];
    }
    
    
    return cell;
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
