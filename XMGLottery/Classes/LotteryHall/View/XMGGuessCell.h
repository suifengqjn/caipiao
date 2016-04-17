//
//  XMGGuessCell.h
//  XMGLottery
//
//  Created by 王峰 on 15/9/12.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMGGuessCell;
@protocol XMGGuessCellDelegate <NSObject>
- (void)cellDidClickChangeBtn:(XMGGuessCell *)cell;
@end
@interface XMGGuessCell : UITableViewCell
@property (nonatomic, weak) id<XMGGuessCellDelegate>delegate;
+ (NSString *)nibName;
@end
