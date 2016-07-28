//
//  JHRootPageView.h
//  JHSlidePageViewController
//
//  Created by John on 16/7/5.
//  Copyright © 2016年 kuxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHRootPageView : UIView


/**
 *  选择按钮的父视图
 */
@property (nonatomic, strong) UIView *btnBgView;

/**
 *  pageViewController
 */
@property (nonatomic, strong) UIPageViewController *pageViewController;

/**
 *  滑动条
 */
@property (nonatomic, strong) UILabel *slideLabel;

/**
 *  初始化PageViewController
 *
 *  @param frame      视图位置大小
 *  @param VcArray    视图数组
 *  @param title      按钮标题
 *  @param bottomLine 是否有底部滑动条
 *  @param controller 添加到所在的控制器
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame
                  controllers:(NSArray *)VcArray
                        title:(NSArray *)title
                         type:(BOOL)bottomLine
                addController:(UIViewController *)controller;


@end
