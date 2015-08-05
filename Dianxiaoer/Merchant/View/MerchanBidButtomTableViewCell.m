//
//  MerchanBidButtomTableViewCell.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/5.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MerchanBidButtomTableViewCell.h"

@interface MerchanBidButtomTableViewCell () <UIScrollViewDelegate>

@end

@implementation MerchanBidButtomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)scrollLeftBtnClick:(id)sender {
    
}

- (IBAction)scrollRightBtnClick:(id)sender {
    
}
- (IBAction)moreWorkBtnClick:(id)sender {
    [self.delegate moreWorkBtnClick];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self.delegate scrollUp:scrollView.contentOffset.y];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
