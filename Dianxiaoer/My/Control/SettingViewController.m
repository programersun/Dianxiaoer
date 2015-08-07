//
//  SettingViewController.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/16.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingHeadTableViewCell.h"
#import "SettingOtherTableViewCell.h"
#import "MyInfoDetailViewController.h"
#import "SR_UserInfoDetail.h"
#import "ModifyMainViewController.h"

@interface SettingViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *settingTableView;
@property (weak, nonatomic) IBOutlet UIButton *logOutBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logOutBtnWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logOutBtnHeight;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _logOutBtn.layer.cornerRadius = _logOutBtn.frame.size.width * HEIGHTCHANGE / 2;
    _logOutBtn.layer.masksToBounds = YES;
    _logOutBtnHeight.constant = _logOutBtnHeight.constant * HEIGHTCHANGE;
    _logOutBtnWidth.constant = _logOutBtnWidth.constant * HEIGHTCHANGE;
    _settingTableView.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)loginOutBtnClick:(id)sender {
    [SR_UserInfoDetail loginOut];
    [self toRootView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    else {
        return 5;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 75 * HEIGHTCHANGE;
    }
    else {
        return 50 * HEIGHTCHANGE;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        SettingHeadTableViewCell *headCell = [tableView dequeueReusableCellWithIdentifier:@"SettingHeadTableViewCell"];
        if (headCell == nil) {
            headCell = [[SettingHeadTableViewCell alloc] init];
        }
        headCell.headImg.image = [UIImage imageNamed:@"shopHeadImg"];
        headCell.headImg.layer.cornerRadius = headCell.headImg.image.size.width / 2;
        headCell.headImg.layer.masksToBounds = YES;
        headCell.headImg.layer.borderColor = [[UIColor colorWithRed:38.0/255 green:206.0/255 blue:183.0/255 alpha:1] CGColor];
        headCell.headImg.layer.borderWidth = 2;
        return headCell;
    }
    else {
        SettingOtherTableViewCell *otherCell = [tableView dequeueReusableCellWithIdentifier:@"SettingOtherTableViewCell"];
        if (otherCell == nil) {
            otherCell = [[SettingOtherTableViewCell alloc] init];
        }
        switch (indexPath.section) {
            case 1:
                otherCell.otherLabel.text = @"账号与安全";
                break;
            case 2:
                otherCell.otherLabel.text = @"清除缓存";
                break;
            case 3:
                otherCell.otherLabel.text = @"辅助功能";
                break;
            case 4:
                otherCell.otherLabel.text = @"关于我们";
                break;
                
            default:
                break;
        }
        
        return otherCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
//            MyInfoDetailViewController *myInfoDetailVC = [[UIStoryboard storyboardWithName:@"My" bundle:nil] instantiateViewControllerWithIdentifier:@"MyInfoDetailViewController"];
//            if (myInfoDetailVC == nil) {
//                myInfoDetailVC = [[MyInfoDetailViewController alloc] init];
//            }
//            [[self navigationController] pushViewController:myInfoDetailVC animated:YES];
            ModifyMainViewController *myInfoDetailVC = [[UIStoryboard storyboardWithName:@"My" bundle:nil] instantiateViewControllerWithIdentifier:@"ModifyMainViewController"];
            if (myInfoDetailVC == nil) {
                myInfoDetailVC = [[ModifyMainViewController alloc] init];
            }
            [[self navigationController] pushViewController:myInfoDetailVC animated:YES];
            break;
        }
            
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;

        default:
            break;
    }
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
