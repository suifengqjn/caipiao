//
//  XMGLotteryChooseModel.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/13.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGLotteryChooseModel.h"

@implementation XMGLotteryChooseModel
+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    XMGLotteryChooseModel *model = [[self alloc]init];
    model.title = dict[@"title"];
    model.subTitle = dict[@"subTitle"];
    
    model.image = dict[@"image"];
    return model;
}
@end
