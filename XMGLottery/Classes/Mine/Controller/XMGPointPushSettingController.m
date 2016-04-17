//
//  XMGPointPushSettingController.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGPointPushSettingController.h"
#import "XMGSettingCell.h"
@interface XMGPointPushSettingController ()
{
    XMGSettingModel *_fromModel;
}

@end

@implementation XMGPointPushSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 基本设置
    self.title = @"比分直播推送";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(handleRightBarItemClick)];
    
    // 创建model对象
    __weakSelf
    XMGSettingModel *from = [XMGSettingModel initWithTitle:@"从" type:XMGSettingCellTypeLabel];
    
    NSString *fromTo = [XMGSettingTool objectForKey:XMGSettingKeyFromTime];
    if (fromTo != nil) {
        from.rightTitle = fromTo;
    }else{//设置默认推送时间
        from.rightTitle = @"00:00";
    }
    
    __weak XMGSettingModel *weakFrom = from;
    from.action = ^{
        UITextField *field = [[UITextField alloc]init];
        
        // 创建date对象
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"HH:mm";
        NSDate *date = [formatter dateFromString:weakFrom.rightTitle];
        
        UIDatePicker *picker = [[UIDatePicker alloc]init];
        picker.date = date;
        // 添加监听事件
        [picker addTarget:self action:@selector(pickValueChange:) forControlEvents:UIControlEventValueChanged];
        
        // 设置日期选择空间的背景色
        picker.backgroundColor = [UIColor whiteColor];
        picker.datePickerMode = UIDatePickerModeTime;
        picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
        
        field.inputView = picker;
    
        [weakSelf.view addSubview:field];
        // 讲field设置为第一响应者
        [field becomeFirstResponder];
    };
    _fromModel = from;
    
    XMGSettingModel *to = [XMGSettingModel initWithTitle:@"至" type:XMGSettingCellTypeLabel];
    to.rightTitle = @"23:59";
    
    // 创建描述每一组应该怎样显示的group对象
    XMGSettingGroup *group = [[XMGSettingGroup alloc]init];
    group.items = @[from, to];
    
    _dataArray = @[
                   group
                   ];
}

#pragma mark - UITabeleView数据源方法
// 修改label的字体颜色
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMGSettingCell *cell = (XMGSettingCell *)[super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    cell.label.textColor = RGB(18, 84, 249);
    return cell;
}

// 右导航栏按钮点击监听事件
- (void)handleRightBarItemClick
{
    if ([self.delegate respondsToSelector:@selector(Vc:dateDidChange:)]) {
        [self.delegate Vc:self dateDidChange:_fromModel.rightTitle];
    }
    // 存储用户的提醒选择时间
    [XMGSettingTool setObject:_fromModel.rightTitle forKey:XMGSettingKeyFromTime];
    
    // 回退到上一级控制器
    [self.navigationController popViewControllerAnimated:YES];
}
// 日期改变的监听事件
- (void)pickValueChange:(UIDatePicker *)picker
{
    // 将日期转化成时间字符串
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"HH:mm";
    NSString *dateStr = [formatter stringFromDate:picker.date];
    
    // 赋值改变后的时间
    _fromModel.rightTitle = dateStr;
    [self.tableView reloadData];
}
@end
