//
//  GiveUpBespeakAlert.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/20.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  GiveUpBespeakAlertDelegate

@optional
- (void)toRootVC;

@end

@interface GiveUpBespeakAlert : UIView
@property (nonatomic, assign) id <GiveUpBespeakAlertDelegate> delegate;
@end
