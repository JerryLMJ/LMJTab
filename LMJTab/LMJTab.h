//
//  LMJTab.h
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

#import <UIKit/UIKit.h>
@class LMJTab;

@protocol LMJTabDelegate <NSObject>

-(void)tab:(LMJTab *)tab didSelectedItemNumber:(NSInteger)number;

@end

@interface LMJTab : UIView

@property (nonatomic,assign) id<LMJTabDelegate>delegate;

/**
 *  控件初始化
 *
 *  @param frame     控件的frame
 *  @param lineWidth 边线宽度
 *  @param lineColor 边线颜色
 *
 *  @return 控件实例
 */
-(id)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor;

/**
 *  设置选项卡的Items
 *
 *  @param titles      选项卡的标题数组
 *  @param nItemColor  正常选项的颜色
 *  @param sItemColor  选中选项的颜色
 *  @param nTitleColor 正常标题的颜色
 *  @param sTitleColor 选中标题的颜色
 *  @param size        标题大小
 *  @param number      默认选中选项（取值范围:0 ~ ...）
*/
-(void)setItemsWithTitle:(NSArray *)titles normalItemColor:(UIColor *)nItemColor selectItemColor:(UIColor *)sItemColor normalTitleColor:(UIColor *)nTitleColor selectTitleColor:(UIColor *)sTitleColor titleTextSize:(CGFloat)size selectItemNumber:(NSInteger)number;



@end
