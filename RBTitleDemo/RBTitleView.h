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

@property (nonatomic, copy) void (^titleButtonClickBlock)(NSInteger index);
@property (nonatomic, assign) BOOL isHaveRightLine;
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *selectColor;

- (instancetype)initWithFrame:(CGRect)frame andTitleArray:(NSArray *)titleArray;

// 设置选中第几个按钮
- (void)setSelectIndex:(NSInteger)index;

// 设置字体
- (void)setButtonTitleFont:(UIFont *)font;

@end
