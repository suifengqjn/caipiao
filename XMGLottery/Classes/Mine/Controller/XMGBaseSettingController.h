//
//  XMGBaseSettingController.h
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMGSettingModel.h"
#import "XMGSettingGroup.h"

#import "XMGSettingTool.h"
#import "XMGSettingKeys.h"

@interface XMGBaseSettingController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_dataArray;
}
@property (nonatomic, strong) UITableView *tableView;
@end
