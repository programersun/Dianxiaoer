//
//  FinshInputMyInfoView.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/16.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FinshInputMyInfoViewDelegate

@optional
- (void)toUpLoadIDVC;

@end

@interface FinshInputMyInfoView : UIView
@property (nonatomic, assign) id <FinshInputMyInfoViewDelegate> delegate;
@end
