//
//  XMGSettingGroup.h
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//  用来描述TableView的每一组应该怎么显示

#import <Foundation/Foundation.h>

@interface XMGSettingGroup : NSObject
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *footer;

@end
