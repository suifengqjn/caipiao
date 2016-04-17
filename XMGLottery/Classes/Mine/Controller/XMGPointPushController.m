//
//  XMGPointPushController.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGPointPushController.h"
#import "XMGSettingCell.h"

#import "XMGPointPushSettingController.h"
@interface XMGPointPushController ()<XMGPointPushSettingControllerDelegate>
{
    XMGSettingModel *_fromToModel;
}
@end

@implementation XMGPointPushController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //基本设置
    self.title = @"比分直播推送";
    
    // 创建显示cell需要的模型对象
    // 创建第0组需要的模型对象
    XMGSettingModel *customTime = [XMGSettingModel initWithTitle:@"自定义时间段" type:XMGSettingCellTypeSwitch];
    
    XMGSettingModel *fromTo = [XMGSettingModel initWithTitle:@"从\n至" type:XMGSettingCellTypeLabel];
    __weakSelf
    fromTo.action = ^{
        // 创建控制器
        XMGPointPushSettingController *pointVc = [[XMGPointPushSettingController alloc]init];
        pointVc.delegate = self;
        [weakSelf.navigationController pushViewController:pointVc animated:YES];
    };
    NSString *fromTime = [XMGSettingTool objectForKey:XMGSettingKeyFromTime];
    if (fromTime != nil) {
        fromTo.rightTitle = [NSString stringWithFormat:@"%@\n23:59",fromTime];
    }else{
        // 设置默认推送时间
        fromTo.rightTitle = @"00:00\n23:59";
    }
    _fromToModel = fromTo;
    
    // 创建描述每0组应该怎么显示的group对象
    XMGSettingGroup *group0 = [[XMGSettingGroup alloc]init];
    group0.header = @"开奖时间在以下时间段内比赛，发送推送提醒";
    group0.items = @[customTime,fromTo];
    
    // 创建第0组需要的模型对象
    XMGSettingModel *allDay = [XMGSettingModel initWithTitle:@"24小时推送" type:XMGSettingCellTypeSwitch];
    
    allDay.subTitle = @"时段：0:00-23:59";
    
    // 创建描述每1组应该怎么显示的group对象
    XMGSettingGroup *group1 = [[XMGSettingGroup alloc]init];
    group1.footer = @"开启比分直播推送后，您会自动接收到投注或关注的比赛的开始，进球以及结束的信息的推送提醒";
    group1.items = @[allDay];
    
    
    _dataArray = @[
                   group0,
                   group1
                  ];
}
#pragma mark - UITabeleView数据源方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMGSettingCell *cell = (XMGSettingCell *)[super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    cell.label.textColor = RGB(18, 84, 249);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
#pragma mark - XMGPointPushSettingControllerDelegate
- (void)Vc:(XMGPointPushSettingController *)vc dateDidChange:(NSString *)date
{
    _fromToModel.rightTitle = [NSString stringWithFormat:@"%@\n23:59",date];
    // 刷新界面
    [self.tableView reloadData];
}
@end
