//
//  XMGSettingCell.h
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMGSettingModel;
@interface XMGSettingCell : UITableViewCell
@property (nonatomic, strong) XMGSettingModel *model;
@property (nonatomic, strong) UILabel *label;
@end
