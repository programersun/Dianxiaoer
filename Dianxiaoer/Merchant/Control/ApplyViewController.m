//
//  ApplyViewController.m
//  Dianxiaoer
//
//  Created by 孙瑞 on 15/8/3.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

#import "ApplyViewController.h"
#import "ApplySuccessView.h"
#import "BidDetailHeaderView.h"
#import "BidDetialTableViewCell.h"
#import "ApplySuccessTableViewCell.h"
#import "ChooseDay.h"

@interface ApplyViewController () <ApplySuccessViewDelegate,BidDetailHeaderViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *applyTableView;

@property (strong, nonatomic) NSMutableArray *cellOpenArray;
@property (nonatomic, strong) ApplySuccessView *applySuccessView;
@property (nonatomic, strong) ChooseDay *chooseDayView;

@end

@implementation ApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cellOpenArray = [[NSMutableArray alloc] initWithObjects:@"0",@"0",@"0",@"0",@"0",nil];
    // Do any additional setup after loading the view.
}

- (IBAction)backBtnClick:(id)sender {
    [self backBtnClick];
}

- (IBAction)rightBtnClick:(id)sender {
    [self chooseViewAppear];
}
- (IBAction)submitBtnClick:(id)sender {
    [self applySuccessViewAppear];
}

- (void)chooseViewAppear {
    UINib *nib = [UINib nibWithNibName:@"ChooseDay" bundle:nil];
    _chooseDayView = [nib instantiateWithOwner:nil options:nil][0];
    UITapGestureRecognizer *backTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseViewDisappear)];
    [_chooseDayView.backgroundImg addGestureRecognizer:backTouch];
    _chooseDayView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self changeFrame:SCREENWIDTH/320 withObjcet:_chooseDayView.cancelBtn];
    [self.view addSubview:_chooseDayView];
    
}

- (void)chooseViewDisappear {
    [_chooseDayView removeFromSuperview];
}

#pragma mark - ApplySuccessViewDelegate

- (void)submitSuccessBtnClick {
    [self toRootView];
}

- (void)telBtnClick {
    [self tel];
}

- (void)applySuccessViewAppear {
    UINib *nib = [UINib nibWithNibName:@"ApplySuccessView" bundle:nil];
    _applySuccessView = [nib instantiateWithOwner:nil options:nil][0];

    _applySuccessView.delegate = self;
    _applySuccessView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self changeFrame:SCREENWIDTH/320 withObjcet:_applySuccessView.submitBtn];
    [self changeFrame:SCREENWIDTH/320 withObjcet:_applySuccessView.telBtn];
    [self.view addSubview:_applySuccessView];
    
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _cellOpenArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60 * HEIGHTCHANGE;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([[_cellOpenArray objectAtIndex:section] isEqualToString:@"1"]) {
        switch (section) {
            case 0:
                return 1;
                break;
            case 1:
                return 1;
                break;
            case 2:
                return 2;
                break;
            case 3:
                return 2;
                break;
            case 4:
                return 1;
                break;
                
            default:
                return 1;
        }
    }
    else {
        return 1;
    }
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return YES;
    }
    else {
        return NO;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_cellOpenArray removeObjectAtIndex:indexPath.section];
        [_applyTableView reloadData];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    switch (indexPath.row) {
        case 0:
        {
            ApplySuccessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ApplySuccessTableViewCell"];
            
            if (cell == nil) {
                cell = [[ApplySuccessTableViewCell alloc] init];
            }
            
            NSString *bidDetailHeaderImgName = [[NSString alloc] initWithFormat:@"apply%ld",(long)indexPath.section];
            cell.cellImg.image = [UIImage imageNamed:bidDetailHeaderImgName];

            return cell;
        }
        case 1:
        {
            BidDetialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BidDetialTableViewCell"];
            
            if (cell == nil) {
                cell = [[BidDetialTableViewCell alloc] init];
            }
            return cell;
        }
        default:
            return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0 ) {
        if ([_cellOpenArray[indexPath.section] isEqualToString:@"0"]) {
            [_cellOpenArray replaceObjectAtIndex:indexPath.section withObject:@"1"];
        }
        else {
            [_cellOpenArray replaceObjectAtIndex:indexPath.section withObject:@"0"];
        }
    }
    
    [_applyTableView reloadData];
}

//#pragma mark - BidDetailHeaderViewDelegate
//
//- (void)bidDetailHeaderClick:(UIButton *)sender {
//    for (int i = 0; i < 5 ; i++) {
//        if (sender.tag == 100 + i && [[_cellOpenArray objectAtIndex:i] isEqualToString:@"0"]) {
//            [_cellOpenArray replaceObjectAtIndex:i withObject:@"1"];
//        }
//        else {
//            [_cellOpenArray replaceObjectAtIndex:i withObject:@"0"];
//        }
//    }
//    [UIView animateWithDuration:1.0 animations:^{
//        [_applyTableView reloadData];
//    }];
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
