//
//  XMGSettingController.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGSettingController.h"

#import "XMGPushController.h"
#import "XMGAboutController.h"

#import "XMGProductController.h"
@interface XMGSettingController ()

@end

@implementation XMGSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";    
    
    // 创建cell需要的模型
    // 第0组的模型对象
    XMGSettingModel *exchange = [XMGSettingModel initWithImage:@"exchange" title:@"使用兑换码" type:XMGSettingCellTypeNone];
    
    // 创建0组的group对象
    XMGSettingGroup *group0 = [[XMGSettingGroup alloc]init];
    group0.items = @[exchange];
    
    // 第1组的模型对象
    XMGSettingModel *push = [XMGSettingModel initWithImage:@"push" title:@"推送和提醒" type:XMGSettingCellTypeArrow];
    
//    __weak XMGSettingController *weakSelf = self;
//    __weak typeof(self) weakSelf = self;
    __weakSelf
    push.action = ^{
        // 创建push控制器
        XMGPushController *pushVc = [[XMGPushController alloc]init];
        [weakSelf.navigationController pushViewController:pushVc animated:YES];
    };
    XMGSettingModel *shake = [XMGSettingModel initWithImage:@"shake" title:@"摇一摇机选" type:XMGSettingCellTypeSwitch];
    shake.key = XMGSettingKeyShake;
    
    XMGSettingModel *sound = [XMGSettingModel initWithImage:@"sound_effect" title:@"声音效果" type:XMGSettingCellTypeSwitch];
    sound.key = XMGSettingKeySound;
    
    XMGSettingModel *wifi = [XMGSettingModel initWithImage:@"wifi_load" title:@"圈子仅WIFI加载" type:XMGSettingCellTypeSwitch];
    wifi.key = XMGSettingKeyWiFi;
    
    // 创建1组的group对象
    XMGSettingGroup *group1 = [[XMGSettingGroup alloc]init];
    group1.items = @[push,shake,sound,wifi];
    
    
    // 第2组模型对象
    XMGSettingModel *recommend = [XMGSettingModel initWithImage:@"share" title:@"推荐给朋友" type:XMGSettingCellTypeArrow];
    
    XMGSettingModel *product = [XMGSettingModel initWithImage:@"netease" title:@"产品推荐" type:XMGSettingCellTypeArrow];
    product.action = ^{
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
        layout.itemSize = CGSizeMake(screenW, 65);
        layout.minimumLineSpacing = 0; // 组与组之间的间距
        XMGProductController *productVc = [[XMGProductController alloc]initWithCollectionViewLayout:layout];
        [self.navigationController pushViewController:productVc animated:YES];
    };
    
    XMGSettingModel *about = [XMGSettingModel initWithImage:@"about" title:@"关于" type:XMGSettingCellTypeArrow];
    about.action = ^{
        XMGAboutController *aboutVc = [[XMGAboutController alloc]init];
        [weakSelf.navigationController pushViewController:aboutVc animated:YES];
    };
    
    // 创建2组的group对象
    XMGSettingGroup *group2 = [[XMGSettingGroup alloc]init];
    group2.items = @[recommend,product,about];
    
    _dataArray = @[
                   group0,
                   group1,
                   group2,
                   ];
}
- (void)dealloc
{
    NSLog(@"dealloc---settingVc");
}
@end
