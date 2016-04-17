//
//  XMGAboutController.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGAboutController.h"

#import "XMGAboutHeaderView.h"
@interface XMGAboutController ()
{
    UIWebView *_webView;
}

@end

@implementation XMGAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"关于";
    // 调整第0组cell距离导航栏的间距
    self.tableView.contentInset = UIEdgeInsetsZero;
    // 创建头部控件
    XMGAboutHeaderView *header = [XMGAboutHeaderView view];
    self.tableView.tableHeaderView = header;
    
    // 只需要创建出来,不要要添加到视图上面来
    _webView = [[UIWebView alloc]initWithFrame:CGRectZero];
    
    // 创建cell需要的模型对象
    XMGSettingModel *support = [XMGSettingModel initWithTitle:@"支持评分" type:XMGSettingCellTypeArrow];
    
    support.action = ^{
        NSString *urlStr = [NSString stringWithFormat:@"http://itunes.apple.com/app/id%@?mt=8",appID];
        NSURL *url = [NSURL URLWithString:urlStr];
        
        if ([[UIApplication sharedApplication]canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    };
    
    XMGSettingModel *telephone = [XMGSettingModel initWithTitle:@"客服电话" type:XMGSettingCellTypeLabel];
    telephone.rightTitle = @"020-83568090";
    
    __weak UIWebView *_weakWebView = _webView;
    telephone.action = ^{
        /*
         第一种方式
         NSURL *url = [NSURL URLWithString:@"tel://020-83568090"];
         if ([[UIApplication sharedApplication] canOpenURL:url]) {
         [[UIApplication sharedApplication] openURL:url];
         }
         */
        /*
         第二种方式,这种方式会有弹层
        NSURL *url = [NSURL URLWithString:@"telprompt://020-83568090"];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
              [[UIApplication sharedApplication] openURL:url];
        }
         */
    
        // 第三种方式
        NSURL *url = [NSURL URLWithString:@"telprompt://020-83568090"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_weakWebView loadRequest:request];
    };

    
    // 创建group对象
    XMGSettingGroup *group = [[XMGSettingGroup alloc]init];
    group.items = @[support ,telephone];
    
    
    _dataArray = @[
                   group
                   ];
}
@end
