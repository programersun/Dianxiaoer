//
//  ScheduleDetailUpTableViewCell.h
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/6.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScheduleDetailUpTableViewCellDelegate <NSObject>

@optional
- (void)scrollDown:(CGFloat)yOff;
@optional
- (void)buttomViewChangeFrame:(CGFloat)yOff withHeightChange:(CGFloat)heightChange;
@optional
- (void)scheduleDetailUpBackBtnClick;

@end

@interface ScheduleDetailUpTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *upScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *upBackgroundImg;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (nonatomic, assign) id<ScheduleDetailUpTableViewCellDelegate> delegate;

@end
