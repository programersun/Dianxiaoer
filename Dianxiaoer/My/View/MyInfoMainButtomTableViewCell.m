//
//  MyInfoMainButtomTableViewCell.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/6.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MyInfoMainButtomTableViewCell.h"

@interface MyInfoMainButtomTableViewCell () <UIScrollViewDelegate>

@end

@implementation MyInfoMainButtomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y >= scrollView.contentSize.height - SCREENHEIGHT) {
        [scrollView setContentOffset:CGPointMake(0, scrollView.contentSize.height - SCREENHEIGHT) animated:NO];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self.delegate scrollUp:scrollView.contentOffset.y];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
