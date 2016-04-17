//
//  XMGSettingCell.m
//  XMGLottery
//
//  Created by 王峰 on 15/9/5.
//  Copyright © 2015年 com.520it.www. All rights reserved.
//

#import "XMGSettingCell.h"

#import "XMGSettingModel.h"
@implementation XMGSettingCell
{
    UISwitch *_toggle; // 开关
    
    UIImageView *_arrow;
}
//{
//    UILabel *_label;
//}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 设置文字字体大小
        self.textLabel.font = [UIFont systemFontOfSize:14];
        self.textLabel.numberOfLines = 0;
        
        // 设置子label的样式
        self.detailTextLabel.font = [UIFont systemFontOfSize:12];
        self.detailTextLabel.textColor = [UIColor lightGrayColor];
        
        // 设置背景色
//        self.backgroundColor = [UIColor redColor];
        // 设置cell普通状态的背景色
        UIView *bg = [[UIView alloc]init];
        bg.backgroundColor = [UIColor whiteColor];
        self.backgroundView = bg;
        // 设置cell选中状态的背景色
        UIView *selBg = [[UIView alloc ]init];
        // RGB(238, 234, 223);
        selBg.backgroundColor = RGB(238, 234, 223);
        
        self.selectedBackgroundView = selBg;
        
    }
    return self;
}
- (void)setModel:(XMGSettingModel *)model
{
    _model = model;
    
    if (model.image != nil) {
        self.imageView.image = [UIImage imageNamed:model.image];
    }
    
    if (model.subTitle) {
        self.detailTextLabel.text = model.subTitle;
    }else{
        self.detailTextLabel.text = nil;
    }
    
    self.textLabel.text = model.title;
    
    if (model.type == XMGSettingCellTypeArrow) {
        // 设置选中样式
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        if (_arrow == nil) {
            _arrow =  [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
        }
        self.accessoryView = _arrow;
        
    }else if (model.type == XMGSettingCellTypeSwitch){
        // 设置选中样式
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        if (_toggle == nil) {
            _toggle = [[UISwitch alloc]init];
            [_toggle addTarget:self action:@selector(handleToggleClick) forControlEvents:UIControlEventValueChanged];
        }
        self.accessoryView = _toggle;
        // 设置开关的闭合状态
        if (model.key != nil) {
           _toggle.on = [[NSUserDefaults standardUserDefaults] boolForKey:model.key];
        }else{ // 开关默认是打开状态
            _toggle.on = YES;
        }
        
    }else if (model.type == XMGSettingCellTypeLabel){
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
        if (_label == nil) {
            // 创建一个label
            _label = [[UILabel alloc]init];
            // 调整label的位置
            CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
            _label.frame =CGRectMake(screenW - 130, 0, 100, self.frame.size.height);
            [self.contentView addSubview:_label];
            
            // 设置对齐方式
            _label.textAlignment = NSTextAlignmentRight;
            // 设置显示的行数
            _label.numberOfLines = 0;
        }
        _label.text = model.rightTitle;
        // 设置字体大小和颜色
        _label.font = [UIFont systemFontOfSize:14];
        _label.textColor = [UIColor blackColor];
    }else{
        self.accessoryView = nil;
    }
}
// 开关的监听事件
- (void)handleToggleClick
{
    [[NSUserDefaults standardUserDefaults] setBool:_toggle.on forKey:_model.key];
}
@end
