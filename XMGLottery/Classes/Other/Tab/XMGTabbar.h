//
//  XMGTabbar.h
//  XMGLottery
//
//  Created by 王峰 on 15/8/24.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMGTabbar;
@protocol XMGTabbarDelegate<NSObject>
@optional;
- (void)tabbar:(XMGTabbar *)bar clickFrom:(NSInteger)from to:(NSInteger)to;
@end
@interface XMGTabbar : UIView
@property (nonatomic, weak) id<XMGTabbarDelegate>delegate;
- (void)addItemWithImage:(NSString *)image selImage:(NSString *)sel;
@end
