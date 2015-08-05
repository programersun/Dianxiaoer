//
//  MerchanBidUPTableViewCell.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/5.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MerchanBidUPTableViewCell.h"

@interface MerchanBidUPTableViewCell () <UIScrollViewDelegate>

@end

@implementation MerchanBidUPTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)backBtnClick:(id)sender {
    [self.delegate bickBtnClick];
}

- (IBAction)shareBtnClick:(id)sender {
    [self.delegate shareBtnClick];
}
- (IBAction)moreDaysBtnClick:(id)sender {
    [self.delegate moreDaysBtnClick];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self.delegate scrollDown:scrollView.contentOffset.y];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
