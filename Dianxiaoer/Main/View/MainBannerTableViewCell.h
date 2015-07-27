//
//  MainBannerTableViewCell.h
//  Dianxiaoer
//
//  Created by Ice on 15/7/15.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  MainBannerTableViewCellDelegate

@optional
- (void)bannerTouch;

@end

@interface MainBannerTableViewCell : UITableViewCell
- (void)startLoadDataBanner;
@property (weak, nonatomic) IBOutlet UICollectionView *bannerCollectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *bannerPageConrtol;
@property (nonatomic, assign) id<MainBannerTableViewCellDelegate> delegate;
@end
