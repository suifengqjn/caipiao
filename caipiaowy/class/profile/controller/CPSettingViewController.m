//
//  CPSettingViewController.m
//  caipiaowy
//
//  Created by qianjianeng on 16/1/8.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "CPSettingViewController.h"
#import "CPSettingItem.h"
#import "CPSettingArrowItem.h"
#import "CPSettingSwitchItem.h"
#import "CPSettingCell.h"
#import "CPSettingGroup.h"
#import "XCTableViewController.h"
#import "CPSettingPushVC.h"
#import "XCHudHelper.h"
#import "CPPushNoticeVC.h"
@interface CPSettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSourceArr;

@end

@implementation CPSettingViewController

- (NSMutableArray *)dataSourceArr
{
    if (_dataSourceArr == nil) {
        // 0组
        CPSettingArrowItem *pushNotice = [CPSettingArrowItem itemWithIcon:[UIImage imageNamed:@"MorePush"] title:@"推送和提醒" destVcClass:[CPPushNoticeVC class]];
        
        
        CPSettingItem *yaoyiyao = [CPSettingSwitchItem itemWithIcon:[UIImage imageNamed:@"handShake"] title:@"摇一摇机选"];
        
        CPSettingItem *sound = [CPSettingSwitchItem itemWithIcon:[UIImage imageNamed:@"sound_Effect"] title:@"声音效果"];
        
        
        CPSettingGroup *group0 = [[CPSettingGroup alloc] init];
        group0.items = @[pushNotice,yaoyiyao,sound];
//        group0.headTitle = @"asdas";
//        group0.footTitle = @"asdasd";
        // 1组
        CPSettingItem *newVersion = [CPSettingArrowItem itemWithIcon:[UIImage imageNamed:@"MoreUpdate"] title:@"检查新版本"];
        // 保存了一段检查更新的功能
        newVersion.option = ^{
            // 1.显示蒙板
            [XCHudHelper showMessage:@"正在检查ing......."];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 2.隐藏蒙板
                [XCHudHelper hideHUD];
                
                // 3.提示用户
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"有更新版本" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"立即更新", nil];
                // 显示UIAlertView
                [alert show];
                
            });
            
            
        };
        CPSettingItem *help = [CPSettingArrowItem itemWithIcon:[UIImage imageNamed:@"MoreHelp"] title:@"帮助" destVcClass:[CPSettingPushVC class]];
        
        CPSettingItem *MoreShare = [CPSettingArrowItem itemWithIcon:[UIImage imageNamed:@"MoreShare"] title:@"分享" destVcClass:[CPSettingPushVC class]];
        CPSettingItem *MoreMessage = [CPSettingArrowItem itemWithIcon:[UIImage imageNamed:@"MoreMessage"] title:@"查看消息" destVcClass:[CPSettingPushVC class]];
        CPSettingItem *MoreNetease = [CPSettingArrowItem itemWithIcon:[UIImage imageNamed:@"MoreNetease"] title:@"产品推荐" destVcClass:[CPSettingPushVC class]];
        CPSettingItem *MoreAbout = [CPSettingArrowItem itemWithIcon:[UIImage imageNamed:@"MoreAbout"] title:@"关于" destVcClass:[CPSettingPushVC class]];
        
        CPSettingGroup *group1 = [[CPSettingGroup alloc] init];
        group1.headTitle = @"帮助";
        group1.items = @[newVersion,help,MoreShare,MoreMessage,MoreNetease,MoreAbout];
        
        _dataSourceArr = [NSMutableArray array];
        [_dataSourceArr addObject:group0];
        [_dataSourceArr addObject:group1];
    }
    return _dataSourceArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataList = self.dataSourceArr;

}


@end
