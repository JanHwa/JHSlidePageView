//
//  JHRootPageView.m
//  JHSlidePageViewController
//
//  Created by John on 16/7/5.
//  Copyright © 2016年 kuxing. All rights reserved.
//

//宽度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
//高度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "JHRootPageView.h"

@interface JHRootPageView ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
{
    NSMutableArray *_vcArray;
}


@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) BOOL isBottom; // 是否有底部滑线

@end


@implementation JHRootPageView

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
                         type:(BOOL)bottomLine
                addController:(UIViewController *)controller

{
    self = [super initWithFrame:frame];
    if (self) {
        [self createButtonTitle:title withBottomLine:bottomLine];
        [self createPageViewController:VcArray addChildViewController:controller];
        _isBottom = bottomLine;
    }
    return self;
}

/**
 *  初始化按钮
 *
 *  @param title 按钮标题数组
 */
- (void)createButtonTitle:(NSArray *)title withBottomLine:(BOOL)bottomLine
{
    _btnBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    [self addSubview:_btnBgView];
    
    for (NSInteger i = 0; i < title.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame     = CGRectMake(kScreenWidth/(title.count) *i, 0,kScreenWidth/(title.count) , 30);
        [_btnBgView addSubview:btn];
        
        btn.tag = 100 + i;
        [btn setTitle:title[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    if (bottomLine) {
        _slideLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, kScreenWidth/(title.count), 2)];
        [_btnBgView addSubview:_slideLabel];
        _slideLabel.backgroundColor = [UIColor redColor];
    }
    
}

/**
 *  创建PageviewController
 *
 *  @param VcArray 
 */
- (void)createPageViewController:(NSArray *)VcArray  addChildViewController:(UIViewController *)controller
{
    _vcArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < VcArray.count; i++) {
        Class class = NSClassFromString(VcArray[i]);
        [_vcArray addObject:[[class alloc] init]];
    }
    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle: UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    [_pageViewController setViewControllers:@[_vcArray[0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        
    }];
    _pageViewController.delegate   = self;
    _pageViewController.dataSource = self;

    _pageViewController.view.frame = CGRectMake(0, 33, kScreenWidth, self.frame.size.height - 30 - 2);
    
    [self addSubview:_pageViewController.view];
    
    // 添加子视图控制器
    [controller addChildViewController:_pageViewController];
    
}

#pragma mark - UIPageViewControllerDelegate
// 向前滑动时调用
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [_vcArray indexOfObject:viewController];
    
    // 当前页是最后一页的时候返回nil
    if (index == _vcArray.count - 1) {
        
        return nil;
    }
    // 如果不是最后一页,返回数组中的下一个视图
    return _vcArray[index + 1];
}

// 向后滑动时调用
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [_vcArray indexOfObject:viewController];
    
    // 如果当前页是第0页,返回nil
    if (index == 0) {
        return nil;
    }
    // else 返回数组中上一个视图
    return _vcArray[index - 1];
}

// 动画结束时调用
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    // 当前视图在此数组中第0个位置
    UIViewController *vc = pageViewController.viewControllers[0];
    self.currentPage     = [_vcArray indexOfObject:vc];
    [self moveSlideLineWithIndex:_currentPage];
}

/**
 *  按钮点击事件
 *
 *  @param sender
 */
- (void)btnClick:(UIButton *)sender
{
    NSInteger index = sender.tag - 100;
    
    [_pageViewController setViewControllers:@[_vcArray[index]] direction:index < _currentPage animated:YES completion:^(BOOL finished) {
    }];
    self.currentPage = index;
    [self moveSlideLineWithIndex:index];

}

/**
 *  滑动线条的移动 按钮的选中
 */
- (void)moveSlideLineWithIndex:(NSInteger)index {
    
    if (_isBottom) {
        for (NSInteger i = 0; i < _vcArray.count; i++) {
            UIButton *btn = [self viewWithTag:100 + i];
            if (index == btn.tag - 100) {
                btn.selected = YES;
            }else{
                btn.selected = NO;
            }
        }
        [UIView animateWithDuration:0.3 animations:^{
            _slideLabel.frame = CGRectMake(kScreenWidth/(_vcArray.count) * index, 30, kScreenWidth/(_vcArray.count), 2);
        }];
    }else{
        for (NSInteger i = 0; i < _vcArray.count; i++) {
            UIButton *btn = [self viewWithTag:100 + i];
            if (index == btn.tag - 100) {
                btn.selected = YES;
            }else{
                btn.selected = NO;
            }
        }

    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
