//
//  XMGProductModel.h
//  XMGLottery
//
//  Created by 王峰 on 15/8/17.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGProductModel : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *stitle;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *customUrl;
+ (instancetype)initWithDict:(NSDictionary *)dict;
@end
