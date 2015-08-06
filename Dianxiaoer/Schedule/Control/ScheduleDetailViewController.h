//
//  ScheduleDetailViewController.h
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/6.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UIView *buttomView;
@property (weak, nonatomic) IBOutlet UIButton *buttomLeftBtn;
@property (weak, nonatomic) IBOutlet UIButton *buttomRightBtn;

@end
