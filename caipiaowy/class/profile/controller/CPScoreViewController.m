//
//  CPScoreViewController.m
//  caipiaowy
//
//  Created by qianjianeng on 16/1/17.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "CPScoreViewController.h"
#import "CPSettingSwitchItem.h"
#import "CPSettingGroup.h"
#import "CPSettingLabelItem.h"

#import "ILSaveTool.h"
@interface CPScoreViewController ()
@property (nonatomic, strong) CPSettingLabelItem *start;
@end

@implementation CPScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addGroup0];
    // 1组
    [self addGroup1];
    // 2组
    [self addGroup2];
}

- (void)addGroup0
{
    CPSettingSwitchItem *notice = [CPSettingSwitchItem itemWithIcon:nil title:@"提醒我关注比赛"];
    
    CPSettingGroup *group = [[CPSettingGroup alloc] init];
    group.items = @[notice];
    [self.dataList addObject:group];
}

- (void)addGroup1
{
    self.start = [CPSettingLabelItem itemWithIcon:nil title:@"开始时间"];

    
    if (!_start.text.length) {
        _start.text = @"00:00";
    }
    
    __weak __typeof(self)weakSelf = self;
    _start.option = ^{
        UITextField *textField = [[UITextField alloc] init];
        
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        // 设置模式
        datePicker.datePickerMode = UIDatePickerModeTime;
        
        // 设置地区
        datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        
        // 创建日期格式对象
        NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
        dateF.dateFormat = @"HH:mm";
        // 设置日期
        datePicker.date = [dateF dateFromString:@"00:00"];
        
        // 监听UIDatePicker
        [datePicker addTarget:weakSelf action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
        
        // 设置键盘
        textField.inputView = datePicker;
        
        [textField becomeFirstResponder];
        [weakSelf.view addSubview:textField];
        
        
    };
    CPSettingGroup *group = [[CPSettingGroup alloc] init];
    group.items = @[_start];
    [self.dataList addObject:group];
}


- (void)valueChange:(UIDatePicker *)datePicker
{
    // 创建日期格式对象
    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
    dateF.dateFormat = @"HH:mm";
    _start.text = [dateF stringFromDate:datePicker.date];
    
    [self.tableView reloadData];
}
- (void)addGroup2
{
    CPSettingLabelItem *stop = [CPSettingLabelItem itemWithIcon:nil title:@"结束时间"];
    stop.text = @"00:00";
    CPSettingGroup *group = [[CPSettingGroup alloc] init];
    group.items = @[stop];
    
    [self.dataList addObject:group];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you wCPl often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
