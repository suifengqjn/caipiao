//
//  CPSettingItem.h
//  caipiaowy
//
//  Created by qianjianeng on 16/1/8.
//  Copyright © 2016年 CP. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ILSettingItemOption)();

@interface CPSettingItem : NSObject

@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) ILSettingItemOption option;

+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title;

@end
