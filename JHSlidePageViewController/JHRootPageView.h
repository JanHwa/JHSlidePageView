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
 *  pageViewController
 */
@property (nonatomic, strong) UIPageViewController *pageViewController;
/**
 *  按钮
 */
@property (nonatomic, strong)UIButton *topButton;

/**
 *  滑动条
 */
@property (nonatomic, strong) UILabel *slideLabel;




/**
 *  初始化PageViewController
 *
 *  @param frame      视图位置大小
 *  @param array      视图数组
 *  @param title      按钮标题
 *  @param bottomLine 是否有地步滑动条
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame
                  controllers:(NSArray *)VcArray
                        title:(NSArray *)title
                         type:(BOOL)bottomLine;

/**
 *  初始化按钮
 *
 *  @param title 按钮标题数组
 */
- (void)createButtonTitle:(NSArray *)title withBottomLine:(BOOL)bottomLine;

@end
