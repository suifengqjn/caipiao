//
//  XMGProductModel.m
//  XMGLottery
//
//  Created by 王峰 on 15/8/17.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGProductModel.h"

@implementation XMGProductModel
+ (instancetype)initWithDict:(NSDictionary *)dict
{
    XMGProductModel *model = [[self alloc]init];
    
    model.title = dict[@"title"];
    model.stitle = dict[@"stitle"];
    model.icon = dict[@"icon"];
    model.customUrl = dict[@"customUrl"];
    model.ID = dict[@"id"];
    model.url = dict[@"url"];
    
    model.icon = [model.icon stringByReplacingOccurrencesOfString:@"@2x" withString:@""];
    
    return model;
}
@end
