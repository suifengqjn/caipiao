//
//  CPSettingArrowItem.m
//  caipiaowy
//
//  Created by qianjianeng on 16/1/10.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "CPSettingArrowItem.h"

@implementation CPSettingArrowItem

+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title destVcClass:(Class)destVcClass
{
    CPSettingArrowItem *item = [super itemWithIcon:icon title:title];
    item.destVcClass = destVcClass;
    
    return item;
}

@end
