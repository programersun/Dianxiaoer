//
//  MerchanBidUPTableViewCell.h
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/5.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MerchanBidUPTableViewCellDelegate <NSObject>

@optional
- (void)scrollDown:(CGFloat)yOff;
@optional
- (void)bickBtnClick;
@optional
- (void)shareBtnClick;
@optional
- (void)moreDaysBtnClick;

@end

@interface MerchanBidUPTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *upBackgroundImg;
@property (weak, nonatomic) IBOutlet UIScrollView *upScrollView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIButton *moreDaysBtn;
@property (nonatomic, assign) id<MerchanBidUPTableViewCellDelegate> delegate;
@end
