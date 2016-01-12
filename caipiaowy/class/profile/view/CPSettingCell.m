//
//  CPSettingCell.m
//  caipiaowy
//
//  Created by qianjianeng on 16/1/10.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "CPSettingCell.h"
#import "CPSettingItem.h"
#import "CPSettingArrowItem.h"
#import "CPSettingSwitchItem.h"
@interface CPSettingCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UISwitch *switchView;

@end

@implementation CPSettingCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _imgView;
}

- (UISwitch *)switchView
{
    if (_switchView == nil) {
        
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}

- (void)setItem:(CPSettingItem *)item
{
    _item = item;
    
    
    // 1.设置cell的子控件的数据
    [self setUpData];
    
    // 2.设置右边视图
    [self setUpAccessoryView];
    
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
}

// 设置cell的子控件的数据
- (void)setUpData
{
    self.imageView.image = _item.icon;
    self.textLabel.text = _item.title;
}

// 设置右边视图
- (void)setUpAccessoryView
{
    if ([_item isKindOfClass:[CPSettingArrowItem class]]) { // 箭头
        self.accessoryView = self.imgView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else if ([_item isKindOfClass:[CPSettingSwitchItem class]]){ // Switch
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone; //Switch取消点击效果
    }else{
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"CPSettingCell";
    CPSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        cell = [[CPSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}

@end
