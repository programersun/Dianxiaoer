//
//  ScheduleDetailButtomTableViewCell.h
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/6.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScheduleDetailButtomTableViewCellDelegate <NSObject>

@optional
- (void)scrollUp:(CGFloat)yOff;
@optional
- (void)moreWorkBtnClick;

@end

@interface ScheduleDetailButtomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *buttomScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *buttomBackgroundImg;
@property (weak, nonatomic) IBOutlet UIButton *scrollLeftBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *middleScrollView;
@property (weak, nonatomic) IBOutlet UIButton *scrollRightBtn;
@property (weak, nonatomic) IBOutlet UIButton *moreWorkBtn;
@property (nonatomic, assign) id<ScheduleDetailButtomTableViewCellDelegate> delegate;

@end
