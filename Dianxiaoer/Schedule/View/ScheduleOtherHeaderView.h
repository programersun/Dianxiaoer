//
//  ScheduleOtherHeaderView.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/22.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  ScheduleOtherHeaderViewDelegate

@optional
- (void)dayCellSelect:(UIButton *)sender;

@end

@interface ScheduleOtherHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIImageView *backImg;
@property (nonatomic, assign) id<ScheduleOtherHeaderViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headImgButtom;
@end
