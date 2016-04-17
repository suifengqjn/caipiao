//
//  XMGAwardPushController.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGAwardPushController.h"

@interface XMGAwardPushController ()

@end

@implementation XMGAwardPushController
{
    // 记录住哪一个cell是蓝色
    UITableViewCell *_selectCell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // 基本设置
    self.title = @"中奖推送";
    
    // 创建显示cell的模型对象
    // 第0组的模型对象
    XMGSettingModel *awardPush = [XMGSettingModel initWithTitle:@"中奖推送" type:XMGSettingCellTypeSwitch];
    awardPush.key = XMGSettingKeyAwardPush;
    
    // 创建group0对象
    XMGSettingGroup *group0 = [[XMGSettingGroup alloc]init];
    group0.footer = @"开奖后,当有新中奖订单,你会收到推送提醒";
    group0.items = @[awardPush];
    // 第1组的模型对象
    XMGSettingModel *allLottery = [XMGSettingModel initWithTitle:@"全部彩种" type:XMGSettingCellTypeNone];
    
    XMGSettingModel *otherLottery = [XMGSettingModel initWithTitle:@"高频彩以外的彩种" type:XMGSettingCellTypeNone];
    // 创建group1对象
    XMGSettingGroup *group1 = [[XMGSettingGroup alloc]init];
    group1.header = @"包括";
    group1.items =  @[allLottery, otherLottery];
    
    _dataArray = @[
                   group0,
                   group1
                   ];
}
#pragma mark - UITableView的数据源方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    // 设置cell点击样式
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 1) {
        NSInteger selectedRow = [[XMGSettingTool objectForKey:XMGSettingKeyAllLottery] integerValue];
        if (selectedRow == NSNotFound) { // 如果没有找到这个值
                if (indexPath.row == 0) { // 设置蓝色箭头
                    cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    _selectCell = cell;
                }
        }else{
            if (indexPath.row == selectedRow) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                _selectCell = cell;
            }
        }
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    if (indexPath.section == 1) {
        // 取消之前的cell的蓝色箭头
        _selectCell.accessoryType = UITableViewCellAccessoryNone;
        
        // 讲用户选择的cell设置为蓝色箭头样式
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        // 记录住用户选择的cell
        _selectCell = cell;
        
        // 存储用户的偏好设置
        [XMGSettingTool setObject:@(indexPath.row) forKey:XMGSettingKeyAllLottery];
    }
}
@end
