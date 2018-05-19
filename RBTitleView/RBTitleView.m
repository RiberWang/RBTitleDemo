//
//  RBTitleView.m
//  LYDApp
//
//  Created by Riber on 16/11/7.
//  Copyright © 2016年 dookay_73. All rights reserved.
//

#import "RBTitleView.h"

@interface RBTitleView ()

@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) UILabel *selectLine; // 选中按钮底线
@property (nonatomic, strong) UILabel *bottomLine; // 视图底部分割线
@property (nonatomic, strong) NSMutableArray *widthArray;
@property (nonatomic, strong) NSMutableArray *buttonArray;

@end

@implementation RBTitleView

- (instancetype)initWithFrame:(CGRect)frame andTitleArray:(NSArray *)titleArray {
    if (self = [super initWithFrame:frame]) {
        _titleArray = titleArray;
        self.backgroundColor = [UIColor whiteColor];
        self.isHaveSelectLine = YES;
        
        _widthArray = [NSMutableArray arrayWithCapacity:0];
        _buttonArray = [NSMutableArray arrayWithCapacity:0];
        [self createUI];
    }
    
    return self;
}


- (void)createUI {
    self.bgScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.bgScrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.bgScrollView];
    
    if (_titleArray.count > MaxScrollCount) {
        for (int i = 0; i < _titleArray.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i*(self.width/MaxScrollCount), 0, self.width/MaxScrollCount, self.bgScrollView.height);
            [button setTitle:_titleArray[i] forState:UIControlStateNormal];
            [button setTitleColor:NormalColor forState:UIControlStateNormal];
            [button setTitleColor:SelectColor forState:UIControlStateSelected];
            button.titleLabel.font = ButtonFont;
            button.tag = i;
            [button addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.bgScrollView addSubview:button];
            
            [self.buttonArray addObject:button];
            
            CGRect rect = [_titleArray[i] boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, button.height) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:button.titleLabel.font} context:nil];
            
            [_widthArray addObject:[NSNumber numberWithFloat:rect.size.width]];
            
            if (i == 0) {
                _bottomLine = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height-1, self.width, 1)];
                _bottomLine.backgroundColor = BottomLineColor;
                [self addSubview:_bottomLine];
                
                // 底部选中的线
                _selectLine = [[UILabel alloc] initWithFrame:CGRectMake((button.width - [_widthArray[0] floatValue])/2.0, self.bgScrollView.height-3, [_widthArray[0] floatValue], 2)];
                _selectLine.backgroundColor = SelectLineColor;
                [self.bgScrollView addSubview:_selectLine];
                button.selected = YES; // 默认第一个选中
            }
            
            self.bgScrollView.contentSize = CGSizeMake(button.frame.origin.x + button.frame.size.width, 0);
        }
    }
    else
    {
        for (int i = 0; i < _titleArray.count; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i*(self.width/_titleArray.count), 0, self.width/_titleArray.count, self.bgScrollView.height);
            [button setTitle:_titleArray[i] forState:UIControlStateNormal];
            [button setTitleColor:NormalColor forState:UIControlStateNormal];
            [button setTitleColor:SelectColor forState:UIControlStateSelected];
            button.titleLabel.font = ButtonFont;
            button.tag = i;
            [button addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.bgScrollView addSubview:button];
            
            [self.buttonArray addObject:button];
            
            CGRect rect = [_titleArray[i] boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, button.height) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:button.titleLabel.font} context:nil];
            
            [_widthArray addObject:[NSNumber numberWithFloat:rect.size.width]];
            
            if (i == 0) {
                _bottomLine = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height-1, self.width, 1)];
                _bottomLine.backgroundColor = BottomLineColor;
                [self addSubview:_bottomLine];
                
                // 底部选中的线
                _selectLine = [[UILabel alloc] initWithFrame:CGRectMake((button.width - [_widthArray[0] floatValue])/2.0, self.height-3, [_widthArray[0] floatValue], 2)];
                _selectLine.backgroundColor = SelectLineColor;
                [self.bgScrollView addSubview:_selectLine];
                button.selected = YES; // 默认第一个选中
            }
        }
    }
}

- (void)setIsHaveRightLine:(BOOL)isHaveRightLine {
    if (isHaveRightLine) {
        if (_titleArray.count > 5) {
            for (int i = 0; i < _titleArray.count-1; i++) {
                UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.width/MaxScrollCount + i*(self.width/MaxScrollCount)-0.5, 10, 0.5, self.height-0.5-2*10)];
                lineLabel.backgroundColor = RightLineColor;
                [_bgScrollView addSubview:lineLabel];
            }
        }
        else
        {
            for (int i = 0; i < _titleArray.count-1; i++) {
                UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.width/self.titleArray.count + i*(self.width/_titleArray.count)-0.5, 10, 0.5, self.height-0.5-2*10)];
                lineLabel.backgroundColor = RightLineColor;
                [_bgScrollView addSubview:lineLabel];
            }
        }
    }
}

- (void)setIsHaveBottomLine:(BOOL)isHaveBottomLine {
    _isHaveBottomLine = isHaveBottomLine;
    
    self.bottomLine.hidden = !isHaveBottomLine;
}

- (void)setIsHaveSelectLine:(BOOL)isHaveSelectLine {
    _isHaveSelectLine = isHaveSelectLine;
    
    self.selectLine.hidden = !isHaveSelectLine;
}

- (void)titleButtonClick:(UIButton *)titleButton {
    for (id obj in self.bgScrollView.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)obj;
            button.selected = NO;
        }
    }
    
    titleButton.selected = YES;
    
    if (self.isHaveSelectLine) {
        self.selectLine.hidden = NO;

        __weak typeof(RBTitleView *)weakSelf = self;
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf.selectLine.frame = CGRectMake(titleButton.x + (titleButton.width-[weakSelf.widthArray[titleButton.tag] floatValue])/2.0, weakSelf.selectLine.y, [weakSelf.widthArray[titleButton.tag] floatValue], weakSelf.selectLine.height);
        }];
    }
    
    if (self.titleButtonClickBlock) {
        self.titleButtonClickBlock(titleButton.tag);
    }
}

- (void)setNormalColor:(UIColor *)normalColor {
    _normalColor = normalColor;
    
    for (UIButton *button in self.buttonArray) {
        [button setTitleColor:normalColor forState:UIControlStateNormal];
    }
}

- (void)setSelectColor:(UIColor *)selectColor {
    _selectColor = selectColor;
    
    for (UIButton *button in self.buttonArray) {
        [button setTitleColor:selectColor forState:UIControlStateSelected];
    }
    
    _selectLine.backgroundColor = selectColor;
}

- (void)setSelectIndex:(NSInteger)index {
    for (UIButton *btn in self.buttonArray) {
        btn.selected = NO;
        if (btn.tag == index) {
            btn.selected = YES;
        }
    }
    
    self.selectLine.hidden = NO;

    __weak typeof(RBTitleView *)weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.selectLine.frame = CGRectMake((self.width/weakSelf.titleArray.count)*index + ((self.width/weakSelf.titleArray.count)-[weakSelf.widthArray[index] floatValue])/2.0, weakSelf.selectLine.y, [self.widthArray[index] floatValue], weakSelf.selectLine.height);
    } completion:^(BOOL finished) {

    }];
}

- (void)clearAllSelect {
    for (UIButton *btn in self.buttonArray) {
        btn.selected = NO;
    }
    
    self.selectLine.hidden = YES;
}

- (void)setButtonTitleFont:(UIFont *)font {
    int i = 0;
    [self.widthArray removeAllObjects];
    
    for (id obj in self.bgScrollView.subviews) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)obj;
            
            button.titleLabel.font = font;
            
            CGRect rect = [_titleArray[i] boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, button.height) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:button.titleLabel.font} context:nil];
            
            [_widthArray addObject:[NSNumber numberWithFloat:rect.size.width]];
            _bottomLine.backgroundColor = BottomLineColor;
            _selectLine.frame = CGRectMake((button.width - [_widthArray[0] floatValue])/2.0, self.selectLine.y, [_widthArray[0] floatValue], 2);

            if (self.selectColor) {
                _selectLine.backgroundColor = self.selectColor;
            }
            else
            {
                _selectLine.backgroundColor = SelectLineColor;
            }
            i++;
        }
    }
}

@end
