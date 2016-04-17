//
//  XMGLotteryChoossCell.h
//  XMGLottery
//
//  Created by 王峰 on 15/9/12.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMGChooseView.h"
@class XMGLotteryChoossCell, XMGLotteryChooseModel;
@protocol XMGLotteryChooseCellDelegate<NSObject>
@optional;
- (void)choossCell:(XMGLotteryChoossCell *)cell didClickAtRightView:(BOOL)isRight;
@end
@interface XMGLotteryChoossCell : UITableViewCell
@property (nonatomic, strong) XMGChooseView *leftView;
@property (nonatomic, strong) XMGChooseView *rightView;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, weak) id<XMGLotteryChooseCellDelegate>delegate;
@property (nonatomic, weak) NSIndexPath *indexPath;

@property (nonatomic, weak) XMGLotteryChooseModel *leftModel;
@property (nonatomic, weak) XMGLotteryChooseModel *rightModel;
@end
