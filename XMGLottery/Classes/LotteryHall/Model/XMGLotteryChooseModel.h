//
//  XMGLotteryChooseModel.h
//  XMGLottery
//
//  Created by 王峰 on 15/9/13.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGLotteryChooseModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *image;
+ (instancetype)modelWithDict:(NSDictionary *)dict;
@end
