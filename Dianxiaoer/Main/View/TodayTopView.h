//
//  TodayTopView.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/20.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  TodayTopViewDelegate

@optional
- (void)todayTopMenuBtnClick;

@end

@interface TodayTopView : UIView
@property (nonatomic, assign) id <TodayTopViewDelegate> delegate;
@end
