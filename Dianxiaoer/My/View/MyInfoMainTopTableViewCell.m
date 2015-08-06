//
//  MyInfoMainTopTableViewCell.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/6.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MyInfoMainTopTableViewCell.h"

@interface MyInfoMainTopTableViewCell () <UIScrollViewDelegate>

@end

@implementation MyInfoMainTopTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)backBtnClick:(id)sender {
    [self.delegate myInfoBackBtnClick];
}
- (IBAction)modfiyBtnClick:(id)sender {
//    [self.delegate modfiyBtnClick];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y <= 0) {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self.delegate scrollDown:scrollView.contentOffset.y];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
