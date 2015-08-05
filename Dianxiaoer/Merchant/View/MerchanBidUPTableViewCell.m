//
//  MerchanBidUPTableViewCell.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/5.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MerchanBidUPTableViewCell.h"

@interface MerchanBidUPTableViewCell () <UIScrollViewDelegate>
@property CGFloat oldyOff;
@end

@implementation MerchanBidUPTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)backBtnClick:(id)sender {
    [self.delegate MerchantBidUpBackBtnClick];
}

- (IBAction)shareBtnClick:(id)sender {
    [self.delegate shareBtnClick];
}
- (IBAction)moreDaysBtnClick:(id)sender {
//    [self.delegate moreDaysBtnClick];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _oldyOff = scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat heightChange = scrollView.contentOffset.y - _oldyOff;
    if (scrollView.contentOffset.y <= 0) {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
    [self.delegate buttomViewChangeFrame:scrollView.contentOffset.y withHeightChange:heightChange];
    _oldyOff = scrollView.contentOffset.y;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self.delegate scrollDown:scrollView.contentOffset.y];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
