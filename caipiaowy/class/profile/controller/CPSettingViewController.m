//
//  CPSettingViewController.m
//  caipiaowy
//
//  Created by qianjianeng on 16/1/8.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "CPSettingViewController.h"
#import "CPSettingItem.h"
#import "CPSettingGroup.h"
#import "XCTableViewController.h"
@interface CPSettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSourceArr;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CPSettingViewController

- (NSMutableArray *)dataSourceArr
{
    if (_dataSourceArr == nil) {
        CPSettingItem *item = [CPSettingItem itemWithIcon:[UIImage imageNamed:@"MorePush"] title:@"推送"];
        CPSettingItem *item1 = [CPSettingItem itemWithIcon:[UIImage imageNamed:@"MorePush"] title:@"推送"];
        CPSettingGroup *group0 = [[CPSettingGroup alloc] init];
        group0.headTitle = @"12";
        group0.footTitle = @"we";
        group0.items = @[item, item1];
        
        CPSettingGroup *group1 = [[CPSettingGroup alloc] init];
        group1.headTitle = @"12";
        group1.footTitle = @"we";
        group1.items = @[item, item1];
        _dataSourceArr = [NSMutableArray array];
        [_dataSourceArr addObject:group0];
        [_dataSourceArr addObject:group1];
    }
    return _dataSourceArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSourceArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CPSettingGroup *group = self.dataSourceArr[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CPSettingGroup *group = self.dataSourceArr[indexPath.section];
    
    CPSettingItem *item = group.items[indexPath.row];
    static NSString *idenfi = @"settingIdenfi";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idenfi];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    cell.textLabel.text = item.title;
    cell.imageView.image = item.icon;
    
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CPSettingGroup *group = self.dataSourceArr[section];

    return group.headTitle;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    CPSettingGroup *group = self.dataSourceArr[section];
    return group.footTitle;
}
@end
