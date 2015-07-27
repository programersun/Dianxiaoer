//
//  BidDetailHeaderView.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/26.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BidDetailHeaderViewDelegate <NSObject>

@optional
- (void)bidDetailHeaderClick:(UIButton *) sender;

@end

@interface BidDetailHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *headerImg;

@property (weak, nonatomic) IBOutlet UIButton *bidHeaderBtn;
@property (assign, nonatomic) id<BidDetailHeaderViewDelegate> delegate;
@end
