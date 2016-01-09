//
//  CPSettingGroup.h
//  caipiaowy
//
//  Created by qianjianeng on 16/1/8.
//  Copyright © 2016年 CP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPSettingGroup : NSObject

@property (nonatomic, copy) NSString *headTitle;
@property (nonatomic, copy) NSString *footTitle;
@property (nonatomic, strong) NSArray *items;
@end
