//
//  ReleasePickerView.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/7/31.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "ReleasePickerView.h"

@interface ReleasePickerView () <UIPickerViewDataSource,UIPickerViewDelegate>

@property NSMutableArray *positionArray;
@property NSMutableArray *cityArray;
@property NSMutableArray *areaArray;
@property NSString *selectString;

@end

@implementation ReleasePickerView

- (id)initWithStyle:(PickerStyle)pickerStyle delegate:(id<ReleasePickerViewDelegate>)delegate {
    UINib *nib = [UINib nibWithNibName:@"ReleasePickerView" bundle:nil];
    self = [nib instantiateWithOwner:nil options:nil][0];
    UITapGestureRecognizer *backTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelPicker)];
    [self.backgroundView addGestureRecognizer:backTouch];
    
    self.delegate = delegate;
    _pickerStyle = pickerStyle;
    
//    _pickerStyle
    
    if (_pickerStyle == ChoosePosition) {
        [_releasePicker selectRow:0 inComponent:0 animated:NO];
        _positionArray = [[NSMutableArray alloc] initWithObjects:@"不限",@"服务员",@"后厨",@"收银员",@"打荷",@"保洁员", nil];
    }
    if (_pickerStyle == ChooseAddress) {
        [_releasePicker selectRow:0 inComponent:0 animated:YES];
        [_releasePicker selectRow:0 inComponent:1 animated:YES];
        [_releasePicker selectRow:0 inComponent:2 animated:YES];
        _cityArray = [[NSMutableArray alloc] initWithObjects:@"大连市",@"沈阳市",@"抚顺市",@"铁岭市", nil];
        _areaArray = [[NSMutableArray alloc] initWithObjects:@"沙河口区",@"中山区",@"甘井子",@"开发区", nil];
    }
    
    _selectString = [[NSString alloc] init];

    return self;
}

- (void)cancelPicker {
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.pickerBackgroundView.frame = CGRectMake(0, SCREENHEIGHT, self.pickerBackgroundView.frame.size.width, self.pickerBackgroundView.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         [self removeFromSuperview];
                         
                     }];
}

- (void)showInView:(UIView *)view {
    self.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    self.pickerBackgroundView.frame = CGRectMake(0, view.frame.size.height, self.pickerBackgroundView.frame.size.width, self.pickerBackgroundView.frame.size.height);
    [view addSubview:self];
    [UIView animateWithDuration:0.5 animations:^{
        self.pickerBackgroundView.frame = CGRectMake(0, view.frame.size.height - self.pickerBackgroundView.frame.size.height, self.pickerBackgroundView.frame.size.width, self.pickerBackgroundView.frame.size.height);
    }];

}

- (IBAction)cancelBtnClick:(id)sender {
    [self cancelPicker];
}
- (IBAction)submitBtnClick:(id)sender {
    [self removeFromSuperview];
    if ([_selectString isEqualToString:@""]) {
        if (_pickerStyle == ChoosePosition ) {
            _selectString = @"不限";
        }
        if (_pickerStyle == ChooseAddress) {
            _selectString = @"辽宁省大连市沙河口区";
        }
    }
    if (_selectString != nil) {
        [self.delegate reloadCell:_selectString];
    }
}

#pragma mark - UIPickerViewDataSource,UIPickerViewDelegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (_pickerStyle == ChooseAddress) {
        return 3;
    }
    else if (_pickerStyle == ChoosePosition){
        return 1;
    }
    else {
        return 2;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (_pickerStyle == ChooseAddress) {
        switch (component) {
            case 0:
                return 1;
                break;
            case 1:
                return _cityArray.count;
//                return 1;
                break;
            case 2:
                return _areaArray.count;
//                return 1;
                break;
                
            default:
                return 0;
                break;
        }
    }
    else if (_pickerStyle == ChoosePosition){
        return _positionArray.count;
    }
    else {
        return 24;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (_pickerStyle == ChooseAddress) {
        switch (component) {
            case 0:
                return @"辽宁省";
                break;
            case 1:
                return [_cityArray objectAtIndex:row];
                break;
            case 2:
                return [_areaArray objectAtIndex:row];
                break;
                
            default:
                return @"";
                break;
        }
    }
    else if (_pickerStyle == ChoosePosition){
        return [_positionArray objectAtIndex:row];
    }
    else {
        return @"ddd";
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _selectString = @"";
    if (_pickerStyle == ChooseAddress) {
        switch (component) {
            case 0:
                _selectString = @"辽宁省";
                break;
            case 1:
                _selectString = [_selectString stringByAppendingString:[_cityArray objectAtIndex:row]];
                break;
            case 2:
                _selectString = [_selectString stringByAppendingString:[_areaArray objectAtIndex:row]];
                break;
                
            default:
                break;
        }
    }
    else if (_pickerStyle == ChoosePosition ){
        _selectString = [_positionArray objectAtIndex:row];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
