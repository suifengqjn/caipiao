//
//  CPPushNoticeVC.m
//  caipiaowy
//
//  Created by qianjianeng on 16/1/11.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "CPPushNoticeVC.h"
#import "CPSettingGroup.h"
#import "CPSettingArrowItem.h"
#import "CPScoreNoticeViewController.h"
#import "CPScoreViewController.h"
@interface CPPushNoticeVC ()

@end

@implementation CPPushNoticeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addGroup0];
    
}

- (void)addGroup0
{
    
    // 0组
    CPSettingItem *push = [CPSettingArrowItem itemWithIcon:nil title:@"开奖号码推送" destVcClass:nil];
    
    
    CPSettingItem *anim = [CPSettingArrowItem itemWithIcon:nil title:@"中奖动画"];
    
    CPSettingItem *score = [CPSettingArrowItem itemWithIcon:nil title:@"比分直播" destVcClass:[CPScoreViewController class]];
    CPSettingItem *timer = [CPSettingArrowItem itemWithIcon:nil title:@"购彩定时提醒"];
    
    CPSettingGroup *group0 = [[CPSettingGroup alloc] init];
    group0.items = @[push,anim,score,timer];
    group0.headTitle = @"dada";
    
    [self.dataList addObject:group0];

    
}
@end
