//
//  bespeakAlertView.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/17.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  bespeakAlertViewDelegate

@optional
- (void)tobespeakVC;

@end

@interface bespeakAlertView : UIView
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (nonatomic, assign) id <bespeakAlertViewDelegate> delegate;
@end
