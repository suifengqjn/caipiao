//
//  XMGPushController.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGPushController.h"
#import "XMGAwardPushController.h"
#import "XMGLotteryPushController.h"
#import "XMGPointPushController.h"
@interface XMGPushController ()

@end

@implementation XMGPushController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推送和提醒";
    
    // 创建显示cell的模型对象
    __weakSelf
    XMGSettingModel *awardPush = [XMGSettingModel initWithTitle:@"中奖推送" type:XMGSettingCellTypeArrow];
    awardPush.action = ^{
        // 创建开奖推送控制器
        XMGAwardPushController *awardVc = [[XMGAwardPushController alloc]init];
        [weakSelf.navigationController pushViewController:awardVc animated:YES];
    };
    
    XMGSettingModel *award = [XMGSettingModel initWithTitle:@"开奖推送" type:XMGSettingCellTypeArrow];
    award.action = ^{
        // 创建开奖控制器
        XMGLotteryPushController *lotteryVc = [[XMGLotteryPushController alloc]init];
        [weakSelf.navigationController pushViewController:lotteryVc animated:YES];
    };
    
    XMGSettingModel *pointPush = [XMGSettingModel initWithTitle:@"比分直播推送" type:XMGSettingCellTypeArrow];
    pointPush.action = ^{
        // 创建直播推送控制器
        XMGPointPushController *pointVc = [[XMGPointPushController alloc]init];
        [weakSelf.navigationController pushViewController:pointVc animated:YES];
    };
    
    XMGSettingModel *animAward = [XMGSettingModel initWithTitle:@"中奖动画" type:XMGSettingCellTypeArrow];
    
    XMGSettingModel *lotteryRemind = [XMGSettingModel initWithTitle:@"购彩提醒" type:XMGSettingCellTypeArrow];
    
    XMGSettingModel *circlePush = [XMGSettingModel initWithTitle:@"圈子推送" type:XMGSettingCellTypeArrow];
    
    // 创建group对象
    XMGSettingGroup *group = [[XMGSettingGroup alloc]init];
    group.items = @[awardPush,award,pointPush,animAward,lotteryRemind,circlePush];
    
    _dataArray = @[
                   group
                   ];
    
}


@end
