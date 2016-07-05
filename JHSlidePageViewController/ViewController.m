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
#define kScreenHeight [UIScreen mainScreen].bounds.size.heigh

#import "ViewController.h"
#import "JHRootPageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
}

- (void)createUI
{
    NSArray *vcArray = @[@"JHOneViewController",@"JHTwoViewController",@"JHThreeViewController",@"JHFourViewController"];
    NSArray *btnTitle = @[@"One",@"Two",@"Three",@"Four"];
    
    JHRootPageView *rootPageView = [[JHRootPageView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth,800) controllers:vcArray title:btnTitle type:YES];

    // 务必加上此行代码
    [self addChildViewController:rootPageView.pageViewController];
    
    [self.view addSubview:rootPageView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end