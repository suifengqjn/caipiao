//
//  CPSettingArrowItem.h
//  caipiaowy
//
//  Created by qianjianeng on 16/1/10.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "CPSettingItem.h"

@interface CPSettingArrowItem : CPSettingItem

// 调整的控制器的类名
@property (nonatomic, assign) Class destVcClass; 

+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title destVcClass:(Class)destVcClass;

@end
