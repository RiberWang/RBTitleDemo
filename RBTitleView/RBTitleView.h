//
//  RBTitleView.h
//  LYDApp
//
//  Created by Riber on 16/11/7.
//  Copyright © 2016年 dookay_73. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"

#define kSCREENW [UIScreen mainScreen].bounds.size.width
#define kSCREENH [UIScreen mainScreen].bounds.size.height

#define MaxScrollCount 5

#define NormalColor [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:1.00]
#define SelectColor [UIColor colorWithRed:0.35 green:0.59 blue:0.99 alpha:1.00]
#define SelectLineColor SelectColor
#define RightLineColor [UIColor colorWithRed:0.58 green:0.58 blue:0.62 alpha:1.00]
#define BottomLineColor [UIColor colorWithRed:0.922 green:0.922 blue:0.922 alpha:1.00]
#define ButtonFont [UIFont systemFontOfSize:(14)*kSCREENW/375]

@interface RBTitleView : UIView

@property (nonatomic, assign) BOOL isHaveRightLine;
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *selectColor;
@property (nonatomic, assign) BOOL isHaveBottomLine;
@property (nonatomic, assign) BOOL isHaveSelectLine;

@property (nonatomic, copy) void (^titleButtonClickBlock)(NSInteger index);

/**
 初始化方法 一定要写

 @param frame frame
 @param titleArray 字符串文字数组
 @return 初始化
 */
- (instancetype)initWithFrame:(CGRect)frame andTitleArray:(NSArray<NSString *> *)titleArray;

/**
 设置选中第几个按钮

 @param index 设置设置选中按钮的索引
 */
- (void)setSelectIndex:(NSInteger)index;


/**
 清空所有选择
 */
- (void)clearAllSelect;

/**
 设置字体大小

 @param font 字体大小
 */
- (void)setButtonTitleFont:(UIFont *)font;

@end
