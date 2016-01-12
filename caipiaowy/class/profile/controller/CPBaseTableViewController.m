//
//  CPBaseTableViewController.m
//  caipiaowy
//
//  Created by qianjianeng on 16/1/11.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "CPBaseTableViewController.h"
#import "CPSettingCell.h"

#import "CPSettingItem.h"

#import "CPSettingArrowItem.h"
#import "CPSettingSwitchItem.h"

#import "CPSettingGroup.h"
@interface CPBaseTableViewController ()

@end

@implementation CPBaseTableViewController

- (NSMutableArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}


// 初始化方法
- (id)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
}



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    CPSettingGroup *group = self.dataList[section];
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 创建cell
    CPSettingCell *cell = [[CPSettingCell class] cellWithTableView:tableView];
    
    // 取出模型
    CPSettingGroup *group = self.dataList[indexPath.section];
    CPSettingItem *item = group.items[indexPath.row];
    
    
    // 传递模型
    cell.item = item;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CPSettingGroup *group = self.dataList[section];
    return group.headTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    CPSettingGroup *group = self.dataList[section];
    return group.footTitle;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 取出模型
    CPSettingGroup *group = self.dataList[indexPath.section];
    CPSettingItem *item = group.items[indexPath.row];
    
    // 执行操作
    if (item.option) {
        item.option();
        return;
    }
    
    if ([item isKindOfClass:[CPSettingArrowItem class]]) { // 需要跳转控制器
        CPSettingArrowItem *arrowItem = (CPSettingArrowItem *)item;
        
        
        // 创建跳转的控制器
        if (arrowItem.destVcClass) {
            
            UIViewController *vc = [[arrowItem.destVcClass alloc] init];
            vc.title = item.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        
    }
    
}


@end
