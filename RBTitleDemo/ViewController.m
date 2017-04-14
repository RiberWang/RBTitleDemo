//
//  ViewController.m
//  RBTitleDemo
//
//  Created by Riber on 2017/4/14.
//  Copyright © 2017年 Riber. All rights reserved.
//

#import "ViewController.h"
#import "RBTitleView.h"

@interface ViewController ()

@property (nonatomic, strong) RBTitleView *titleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"我的标题视图";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createUI];
}


- (void)createUI {
    self.titleView = [[RBTitleView alloc] initWithFrame:CGRectMake(0, 64, kSCREENW, 44) andTitleArray:@[@"器械", @"课程"]];
    self.titleView.isHaveRightLine = YES;
    [self.titleView setButtonTitleFont:[UIFont systemFontOfSize:16]];
     self.titleView.titleButtonClickBlock = ^(NSInteger index) {

     };
     
     [self.view addSubview:self.titleView];

}

@end
