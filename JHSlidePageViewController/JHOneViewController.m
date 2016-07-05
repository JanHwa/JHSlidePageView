//
//  JHOneViewController.m
//  JHSlidePageViewController
//
//  Created by John on 16/7/5.
//  Copyright © 2016年 kuxing. All rights reserved.
//

#import "JHOneViewController.h"
#import "JHFourViewController.h"

@interface JHOneViewController ()

@end

@implementation JHOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    [self createUI];
}

- (void)createUI
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 150, 50);
    [self.view addSubview:btn];
    [btn setTitle:@"Jump to Four" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnClick:(UIButton *)sender
{
    JHFourViewController *four = [[JHFourViewController alloc] init];
    [self.navigationController pushViewController:four animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
