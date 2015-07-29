//
//  SearchAlert.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/20.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  SearchAlertDelegate

@optional
- (void)toRootVC;

@end

@interface SearchAlert : UIView
@property (nonatomic, assign) id <SearchAlertDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@end
