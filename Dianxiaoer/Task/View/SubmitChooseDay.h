//
//  SubmitChooseDay.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/24.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SubmitChooseDayDelegate
@optional
-(void)submitChooseDayBtnClick;

@end

@interface SubmitChooseDay : UIView
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImg;

@property (nonatomic, assign) id<SubmitChooseDayDelegate> delegate;
@end
