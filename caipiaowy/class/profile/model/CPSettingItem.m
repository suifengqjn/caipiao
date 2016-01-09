//
//  CPSettingItem.m
//  caipiaowy
//
//  Created by qianjianeng on 16/1/8.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "CPSettingItem.h"

@interface CPSettingItem ()


@end

@implementation CPSettingItem

+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title
{
    CPSettingItem *item = [[self alloc] init];  //item有可能会有子类，用self创建更合理
    item.icon = icon;
    item.title = title;
    
    return item;
}

@end
