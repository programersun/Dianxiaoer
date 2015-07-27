//
//  BuyCollectionViewCell.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/23.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BuyCollectionViewCellDelegate <NSObject>

@optional
-(void)headImgClick;
@optional
-(void)chooseDay;

@end

@interface BuyCollectionViewCell : UICollectionViewCell
@property (nonatomic, assign) id<BuyCollectionViewCellDelegate> delegate;
@end
