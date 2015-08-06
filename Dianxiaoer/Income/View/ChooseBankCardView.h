//
//  ChooseBankCardView.h
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/6.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  ChooseBankCardViewDelegate

@optional
- (void)changeBankCard;

@end

@interface ChooseBankCardView : UIView
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *chooseImg;
@property (nonatomic, assign) id <ChooseBankCardViewDelegate> delegate;
@end
