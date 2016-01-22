//
//  LMJTab.m
//  选项卡
//
//  Version:1.0.0
//
//  Created by MajorLi on 14-12-15.
//  Copyright (c) 2014年 iOS开发者公会. All rights reserved.
//
//  iOS开发者公会-技术1群 QQ群号：87440292
//  iOS开发者公会-技术2群 QQ群号：232702419
//  iOS开发者公会-议事区  QQ群号：413102158
//

#import "LMJTab.h"

@implementation LMJTab
{
    CGFloat _lineWidth;
    UIColor * _lineColor;
    
    UIColor * _normalItemColor;
    UIColor * _selectItemColor;
    UIColor * _normalTitleColor;
    UIColor * _selectTitleColor;
}

- (id)init{
    NSAssert(NO, @"禁止使用init函数进行初始化，请使用initWithFrame:lineWidth:lineColor:函数进行控件的初始化!");
    return nil;
}

- (id)initWithFrame:(CGRect)frame
{
    NSAssert(NO, @"禁止使用initWithFrame:函数进行初始化，请使用initWithFrame:lineWidth:lineColor:函数进行控件的初始化!");
    return nil;
}

-(id)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.layer.borderWidth = lineWidth;
        self.layer.borderColor = lineColor.CGColor;
        _lineWidth = lineWidth;
        _lineColor = lineColor;
    }
    return self;
}

-(void)setItemsWithTitle:(NSArray *)titles normalItemColor:(UIColor *)nItemColor selectItemColor:(UIColor *)sItemColor normalTitleColor:(UIColor *)nTitleColor selectTitleColor:(UIColor *)sTitleColor titleTextSize:(CGFloat)size selectItemNumber:(NSInteger)number{
    
    _normalItemColor = nItemColor;
    _selectItemColor = sItemColor;
    _normalTitleColor = nTitleColor;
    _selectTitleColor = sTitleColor;
    
    CGFloat width = self.frame.size.width/titles.count;
    
    for (int i = 0; i< titles.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(width *i, 0, width, self.frame.size.height)];
        [button setTitle:[titles objectAtIndex:i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:size];
        button.tag = 1000+i;
        if (i == number) {
            [button setTitleColor:sTitleColor forState:UIControlStateNormal];
            [button setBackgroundColor:sItemColor];
        }else{
            [button setTitleColor:nTitleColor forState:UIControlStateNormal];
            [button setBackgroundColor:nItemColor];
        }
        [button addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
    for (int i = 0; i < titles.count-1; i++) {
        UIView * line = [[UIView alloc] initWithFrame:CGRectMake(width*(i+1)-(_lineWidth/2), 0, _lineWidth, self.frame.size.height)];
        line.backgroundColor = _lineColor;
        [self addSubview:line];
    }
}

-(void)clickedButton:(UIButton *)button{
    for (UIView * view in self.subviews) {
        if (view.tag >= 1000) {
            UIButton * btn = (UIButton *)view;
            if (btn.tag == button.tag) {
                [btn setTitleColor:_selectTitleColor forState:UIControlStateNormal];
                [btn setBackgroundColor:_selectItemColor];
            }else{
                [btn setTitleColor:_normalTitleColor forState:UIControlStateNormal];
                [btn setBackgroundColor:_normalItemColor];
            }
        }
    }
    
    [self.delegate tab:self didSelectedItemNumber:button.tag-1000];
}

@end
