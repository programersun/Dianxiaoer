//
//  ReleasePickerView.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/7/31.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "ReleasePickerView.h"

@interface ReleasePickerView () <UIPickerViewDataSource,UIPickerViewDelegate>

{
    NSArray *provinces, *cities, *areas;
}

@property NSMutableArray *positionArray;
@property NSMutableArray *timeStartArray;
@property NSMutableArray *timeEndArray;

@end

@implementation ReleasePickerView


-(HZLocation *)locate
{
    if (_locate == nil) {
        _locate = [[HZLocation alloc] init];
    }
    
    return _locate;
}

- (id)initWithStyle:(PickerStyle)pickerStyle delegate:(id<ReleasePickerViewDelegate>)delegate {
    UINib *nib = [UINib nibWithNibName:@"ReleasePickerView" bundle:nil];
    self = [nib instantiateWithOwner:nil options:nil][0];
    UITapGestureRecognizer *backTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelPicker)];
    [self.backgroundView addGestureRecognizer:backTouch];
    
    self.delegate = delegate;
    _pickerStyle = pickerStyle;
    
    if (_pickerStyle == ChoosePosition) {
        _positionArray = [[NSMutableArray alloc] initWithObjects:@"服务员",@"后厨",@"收银员",@"打荷",@"保洁员", nil];
        _position = @"服务员";
    }
    if (_pickerStyle == ChooseAddress) {
        
        provinces = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"area.plist" ofType:nil]];
        cities = [[provinces objectAtIndex:0] objectForKey:@"cities"];
        self.locate.state = [[provinces objectAtIndex:0] objectForKey:@"state"];
        self.locate.city = [[cities objectAtIndex:0] objectForKey:@"city"];
        
        areas = [[cities objectAtIndex:0] objectForKey:@"areas"];
        if (areas.count > 0) {
            self.locate.district = [areas objectAtIndex:0];
        } else{
            self.locate.district = @"";
        }
    }
    
    if (pickerStyle == ChooseTime) {
        _timeStartArray = [[NSMutableArray alloc] init];
        _timeEndArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 24; i++) {
            NSString *start;
            NSString *end;
            if (i < 9) {
                start = [[NSString alloc] initWithFormat:@"0%ld:00",(long)i];
                end = [[NSString alloc] initWithFormat:@"0%ld:00",(long)i+1];
            }
            else {
                start = [[NSString alloc] initWithFormat:@"%ld:00",(long)i];
                end = [[NSString alloc] initWithFormat:@"%ld:00",(long)i+1];
            }
            [_timeStartArray addObject:start];
            [_timeEndArray addObject:end];
        }
        _timeStart = @"00:00";
        _timeEnd   = @"01:00";
        _timeCount = 0;
    }

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
    if([self.delegate respondsToSelector:@selector(pickerDidChaneStatus:)]) {
        [self.delegate pickerDidChaneStatus:self];
    }

}

#pragma mark - UIPickerViewDataSource,UIPickerViewDelegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (_pickerStyle == ChooseAddress) {
        return 3;
    }
    if (_pickerStyle == ChoosePosition){
        return 1;
    }
    if (_pickerStyle == ChooseTime) {
        return 2;
    }
    else {
        return 0;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (_pickerStyle == ChooseAddress) {
        switch (component) {
            case 0:
                return [provinces count];
                break;
            case 1:
                return [cities count];
                break;
            case 2:
                return [areas count];
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

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
          forComponent:(NSInteger)component reusingView:(UIView *)view
{
    NSString *title = @"";
    CGFloat num = 1.0;
    if (_pickerStyle == ChooseAddress) {
        num = 3.0;
        switch (component) {
            case 0:
                title = [[provinces objectAtIndex:row] objectForKey:@"state"];
                break;
            case 1:
                title = [[cities objectAtIndex:row] objectForKey:@"city"];
                break;
            case 2:
                if ([areas count] > 0) {
                    title = [areas objectAtIndex:row];
                }
                break;
        }
    }
    else if (_pickerStyle == ChoosePosition){
        num = 1.0;
        title = [_positionArray objectAtIndex:row];
    }
    else if (_pickerStyle == ChooseTime) {
        num = 2.0;
        switch (component) {
            case 0:
                title = [_timeStartArray objectAtIndex:row];
                break;
            case 1:
                title = [_timeEndArray objectAtIndex:row];
                break;
        }
    }
    UILabel *pickLaber = view ? (UILabel *) view : [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, SCREENWIDTH/num, 20.0f)];
    pickLaber.text = title;
    [pickLaber setFont:[UIFont systemFontOfSize: 15]];
    [pickLaber setTextColor:[UIColor whiteColor]];
    [pickLaber setTextAlignment:NSTextAlignmentCenter];
    pickLaber.backgroundColor = [UIColor clearColor];

    return pickLaber;
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (_pickerStyle == ChooseAddress) {
        switch (component) {
            case 0:
                cities = [[provinces objectAtIndex:row] objectForKey:@"cities"];
                [_releasePicker selectRow:0 inComponent:1 animated:YES];
                [_releasePicker reloadComponent:1];
                
                areas = [[cities objectAtIndex:0] objectForKey:@"areas"];
                [_releasePicker selectRow:0 inComponent:2 animated:YES];
                [_releasePicker reloadComponent:2];
                
                self.locate.state = [[provinces objectAtIndex:row] objectForKey:@"state"];
                self.locate.city = [[cities objectAtIndex:0] objectForKey:@"city"];
                if ([areas count] > 0) {
                    self.locate.district = [areas objectAtIndex:0];
                } else{
                    self.locate.district = @"";
                }
                break;
            case 1:
                areas = [[cities objectAtIndex:row] objectForKey:@"areas"];
                [_releasePicker selectRow:0 inComponent:2 animated:YES];
                [_releasePicker reloadComponent:2];
                
                self.locate.city = [[cities objectAtIndex:row] objectForKey:@"city"];
                if ([areas count] > 0) {
                    self.locate.district = [areas objectAtIndex:0];
                } else{
                    self.locate.district = @"";
                }
                break;
            case 2:
                if ([areas count] > 0) {
                    self.locate.district = [areas objectAtIndex:row];
                } else{
                    self.locate.district = @"";
                }
                break;
            default:
                break;
        }
    }
    if (_pickerStyle == ChoosePosition ){
        _position = [_positionArray objectAtIndex:row];
    }
    
    if (_pickerStyle == ChooseTime) {
        switch (component) {
            case 0:
                _timeStart = [[NSString alloc] initWithFormat:@"%@",[_timeStartArray objectAtIndex:row]];
                
                break;
            case 1:
                _timeEnd = [[NSString alloc] initWithFormat:@"%@",[_timeEndArray objectAtIndex:row]];
                break;
            default:
                break;
        }
//        _selectString = [[NSString alloc] initWithFormat:@"%@ - %@",start,end];
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
