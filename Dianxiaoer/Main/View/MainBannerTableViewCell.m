//
//  MainBannerTableViewCell.m
//  Dianxiaoer
//
//  Created by Ice on 15/7/15.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "MainBannerTableViewCell.h"
#import "MainBannerCollectionViewCell.h"

#define pageControlNum 3

@interface MainBannerTableViewCell () <UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout , UIScrollViewDelegate>

@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, assign) BOOL isDrag;
@property (nonatomic, assign) int  currentSize;
@property (nonatomic, assign) int  isCanValue;
@end

@implementation MainBannerTableViewCell

- (void)awakeFromNib {
    self.isDrag = NO;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)startLoadDataBanner {
    [self.timer invalidate];
    self.timer = nil;
    if (self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changeImage) userInfo:nil repeats:YES ];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    }
}

- (void)changeImage {
    if (self.isDrag) {
        return;
    }
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat currentOff  = _bannerCollectionView.contentOffset.x;
    _isCanValue   = (int)currentOff % (int)screenWidth;
    _currentSize = (int)(currentOff / screenWidth);
    if (_currentSize < pageControlNum - 1) {
        [self changePageCount:_currentSize + 1];
    }
    else {
        [self changePageCount:0];
    }
    if (_isCanValue != 0) {
        
        if (_currentSize > pageControlNum - 1) {
            
            [_bannerCollectionView setContentOffset:CGPointMake((_currentSize + 1) * screenWidth, 0) animated:YES];
            [_bannerCollectionView setContentOffset:CGPointMake(0, 0) animated:NO];
        }
        else {
            [_bannerCollectionView setContentOffset:CGPointMake((_currentSize + 1) * screenWidth, 0) animated:YES];
        }
    }
    else {
        
        if (_currentSize > pageControlNum - 1) {
            [_bannerCollectionView setContentOffset:CGPointMake(_bannerCollectionView.contentOffset.x + screenWidth, 0) animated:YES];
            [_bannerCollectionView setContentOffset:CGPointMake(0, 0) animated:NO];
        }
        else {
            [_bannerCollectionView setContentOffset:CGPointMake(_bannerCollectionView.contentOffset.x + screenWidth, 0) animated:YES];
        }
    }
}

- (void)changePageCount:(NSInteger)pageNum {
    _bannerPageConrtol.currentPage = pageNum;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainBannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mainBannerCollectionViewCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[MainBannerCollectionViewCell alloc] init];
    }
    cell.bannerImg.image = [UIImage imageNamed:@"banner"];
    if (indexPath.row == 0 || indexPath.row == pageControlNum) {
        cell.bannerImg.image = [UIImage imageNamed:@"banner"];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return pageControlNum + 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake([UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.width / 2 );
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.isDrag = YES;
    [self.timer invalidate];
    self.timer = nil;
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    [self startLoadDataBanner];
    self.isDrag = NO;
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGPoint point = *targetContentOffset;
    _currentSize = (int)(point.x / screenWidth);
    _isCanValue   = (int)point.x % (int)screenWidth;
    if (_currentSize < pageControlNum && _currentSize != 0) {
        [self changePageCount:_currentSize];
    }
    else {
        [self changePageCount:0];
        [_bannerCollectionView setContentOffset:CGPointMake(0, 0) animated:NO];
    }

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate bannerTouch];
}
    
@end
