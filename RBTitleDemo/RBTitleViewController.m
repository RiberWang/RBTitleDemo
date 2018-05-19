//
/*****************************************
 *                                       *
 *  @dookay.com Internet make it happen  *
 *  ----------- -----------------------  *
 *  dddd  ddddd Internet make it happen  *
 *  o   o     o Internet make it happen  *
 *  k    k    k Internet make it happen  *
 *  a   a     a Internet make it happen  *
 *  yyyy  yyyyy Internet make it happen  *
 *  ----------- -----------------------  *
 *  Say hello to the future.		     *
 *  hello，未来。                   	     *
 *  未来をその手に。                        *
 *                                       *
 *****************************************/
//
//  RBTitleViewController.m
//  RBTitleDemo
//
//  Created by Riber on 2018/1/30.
//  Copyright © 2018年 Riber. All rights reserved.
//

#import "RBTitleViewController.h"
#import "RBTitleView.h"

@interface RBTitleViewController ()

@property (nonatomic, strong) RBTitleView *titleView;

@end

@implementation RBTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;

    [self createUI];
}

- (void)createUI {
    NSArray *dataArray;
    if (self.type == 0) {
        dataArray = @[@"器械", @"课程"];
    }
    else if (self.type == 1) {
        dataArray = @[@"土豪榜", @"订阅榜", @"打赏榜", @"新书榜", @"点赞榜", @"畅销榜"];
    }
    else {
        dataArray = @[@"1", @"2"];
    }
    self.titleView = [[RBTitleView alloc] initWithFrame:CGRectMake(0, 0, kSCREENW, 44) andTitleArray:dataArray];
    if (self.type == 0) {
        self.titleView.isHaveRightLine = YES;
    }
    else {
        self.titleView.isHaveRightLine = NO;
    }
    [self.titleView setButtonTitleFont:[UIFont systemFontOfSize:16]];
    self.titleView.titleButtonClickBlock = ^(NSInteger index) {
        
    };
    
    [self.view addSubview:self.titleView];
    
}


@end
