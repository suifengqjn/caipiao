//
//  CPSettingLabelItem.m
//  caipiaowy
//
//  Created by qianjianeng on 16/1/17.
//  Copyright © 2016年 CP. All rights reserved.
//

#import "CPSettingLabelItem.h"

@implementation CPSettingLabelItem

- (void)setText:(NSString *)text
{
    _text = text;
    
    [ILSaveTool setObject:text forKey:self.title];
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    _text = [ILSaveTool objectForKey:self.title];
}

@end
