//
//  ViewController.m
//  JHSlidePageViewController
//
//  Created by John on 16/7/5.
//  Copyright © 2016年 kuxing. All rights reserved.
//

//宽度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
//高度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "JHPageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
}

- (void)createUI {
    NSArray *vcArray = @[@"JHOneViewController",@"JHTwoViewController",@"JHThreeViewController",@"JHFourViewController"];
    NSArray *btnTitle = @[@"买入",@"卖出",@"撤单",@"已成交"];
    
    JHPageView *rootPageView = [[JHPageView alloc] initWithFrame:CGRectMake(0, 84, kScreenWidth,kScreenHeight - 64)
                                                     controllers:vcArray
                                                           title:btnTitle
                                                            type:YES
                                                   addController:self
                                                       btnHeight:40
                                                  btnNormalColor:[UIColor colorWithRed:0.35 green:0.40 blue:0.50 alpha:1.00]
                                                  btnSelectcolor:[UIColor colorWithRed:1.00 green:0.50 blue:0.25 alpha:1.00]];

    rootPageView.font = [UIFont systemFontOfSize:13.f];
    [self.view addSubview:rootPageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
