//
//  ReleaseViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/22.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "ReleaseViewController.h"
#import "ReleaseTableViewCell.h"
#import "ReleasePickerView.h"

@interface ReleaseViewController () <UITableViewDataSource,UITableViewDelegate,ReleasePickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *releaseTableView;
@property NSMutableArray *startSelectArray;
@property NSMutableArray *selectArray;
@property NSMutableArray *isSelectArray;

@property (nonatomic, strong) ReleasePickerView *releasePickerView;

@end

@implementation ReleaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _startSelectArray = [[NSMutableArray alloc] initWithObjects:
                         @"想去哪里兼职？",
                         @"选择想要工作的日期",
                         @"选择想要工作的时间段",
                         @"想从事什么餐饮职业？", nil];
    _selectArray = [[NSMutableArray alloc] initWithObjects:@"",@"",@"",@"", nil];
    _isSelectArray = [[NSMutableArray alloc] initWithObjects:@"0",@"0",@"0",@"0", nil];
    
    // Do any additional setup after loading the view.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)releaseBtnClick:(id)sender {
    
}

#pragma mark - ReleasePickerViewDelegate

- (void)reloadCell:(NSString *)chooseString {
    if (_releasePickerView.pickerStyle == ChooseAddress) {
        _selectArray[0] = chooseString;
        _isSelectArray[0] = @"1";
    }
    if (_releasePickerView.pickerStyle == ChoosePosition) {
        _selectArray[3] = chooseString;
        _isSelectArray[3] = @"1";
    }
    [_releaseTableView reloadData];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60 * HEIGHTCHANGE;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReleaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReleaseTableViewCell"];
    if (cell == nil) {
        cell = [[ReleaseTableViewCell alloc] init];
    }
    
    cell.iconImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"release0%ld",(long)indexPath.row]];
    [cell.infoLabel setFont:[UIFont systemFontOfSize:15 * HEIGHTCHANGE]];
    if ([[_isSelectArray objectAtIndex:indexPath.row] isEqualToString:@"0"]) {
        cell.infoLabel.text = [_startSelectArray objectAtIndex:indexPath.row];
        [cell.infoLabel setTextColor:[UIColor grayColor]];
    }
    else {
        cell.infoLabel.text = [_selectArray objectAtIndex:indexPath.row];
        [cell.infoLabel setTextColor:[UIColor blackColor]];
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _releasePickerView = nil;
    switch (indexPath.row) {
        case 0:
            _releasePickerView = [[ReleasePickerView alloc] initWithStyle:ChooseAddress delegate:self];
            [_releasePickerView showInView:self.view];
            _releasePickerView.titleLabel.text = @"工作地点";
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            _releasePickerView = [[ReleasePickerView alloc] initWithStyle:ChoosePosition delegate:self];
            [_releasePickerView showInView:self.view];
            _releasePickerView.titleLabel.text = @"选择职位";
            
            break;
        default:
            break;
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
