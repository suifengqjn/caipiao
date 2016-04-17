//
//  XMGBaseSettingController.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGBaseSettingController.h"
#import "XMGSettingCell.h"

@interface XMGBaseSettingController ()

@end

@implementation XMGBaseSettingController
- (void)loadView
{
    [super loadView];
    
    // 创建TableView
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 修改tableView的背景色
    self.tableView.backgroundColor = GlobeColor;
    
    // 修改组之间的间距
    self.tableView.sectionHeaderHeight = 10;
    self.tableView.sectionFooterHeight = 0;
    // 调整第0组cell距离导航栏的间距
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
}
#pragma mark - UITableView的数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    XMGSettingGroup *group = _dataArray[section];
    
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID  = @"cell";
    XMGSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[XMGSettingCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    XMGSettingGroup *group = _dataArray[indexPath.section];
    XMGSettingModel *model = group.items[indexPath.row];
    
    cell.model = model;
    
    return cell;
}
// cell的点击监听事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中状态的背景色
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    XMGSettingGroup *group = _dataArray[indexPath.section];
    XMGSettingModel *model = group.items[indexPath.row];
    
    if (model.action) {
        model.action();
    }
}

#pragma mark - UITableViewDelegate
#pragma mark - 返回头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    XMGSettingGroup *group = _dataArray[section];
    
    return group.header;
}
#pragma mark - 返回尾部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    XMGSettingGroup *group = _dataArray[section];
    
    return group.footer;
}
@end
