//
//  XMGLotteryPushController.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGLotteryPushController.h"

@interface XMGLotteryPushController ()

@end

@implementation XMGLotteryPushController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 基本设置
    self.title = @"开奖推送设置";
    self.tableView.contentInset = UIEdgeInsetsZero;
    
    // 设置头部控件
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CouponBuyHeader"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.tableView.tableHeaderView = imageView;
    
    // 创建cell需要的模型对象
    // 双色球
    XMGSettingModel *model0 =[XMGSettingModel initWithTitle:@"双色球" type:XMGSettingCellTypeSwitch];
    model0.subTitle = @"每周二、四、日开奖";
    
    // 大乐透
    XMGSettingModel *model1 =[XMGSettingModel initWithTitle:@"大乐透" type:XMGSettingCellTypeSwitch];
    model1.subTitle  = @"每周一、三、六开奖";
    
    // 七乐彩
    XMGSettingModel *model2 =[XMGSettingModel initWithTitle:@"七乐彩" type:XMGSettingCellTypeSwitch];
    model2.subTitle = @"每周开奖，包括试机号提醒";
    
    // 七星彩
    XMGSettingModel *model3 =[XMGSettingModel initWithTitle:@"七星彩" type:XMGSettingCellTypeSwitch];
    model3.subTitle = @"每周二、五、日开奖";
    
    // 排列3
    XMGSettingModel *model4 =[XMGSettingModel initWithTitle:@"排列3" type:XMGSettingCellTypeSwitch];
    model4.subTitle = @"每天开奖";
    
    // 排列5
    XMGSettingModel *model5 =[XMGSettingModel initWithTitle:@"排列5" type:XMGSettingCellTypeSwitch];
    model5.subTitle = @"每天开奖";
    
    // 创建描述每一组应该怎么显示的group对象
    XMGSettingGroup *group = [[XMGSettingGroup alloc]init];
    group.items = @[model0,model1,model2,model3,model4,model5];
    
    _dataArray = @[
                   group
                   ];
}

@end
