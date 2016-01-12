//
//  CPSettingCell.h
//  caipiaowy
//
//  Created by qianjianeng on 16/1/10.
//  Copyright © 2016年 CP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CPSettingItem;

@interface CPSettingCell : UITableViewCell


@property (nonatomic, strong) CPSettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
