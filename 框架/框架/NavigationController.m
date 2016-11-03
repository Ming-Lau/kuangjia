//
//  NavigationController.m
//  框架
//
//  Created by 刘明 on 16/3/21.
//  Copyright © 2016年 LM. All rights reserved.
//

#import "NavigationController.h"
#import "AppDelegate.h"
#import "SubLBXScanViewController.h"

@interface NavigationController ()

@end

@implementation NavigationController

+ (void)initialize
{
    /**
     *地对地导弹
     */
    
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置普通状态
    // key：NS****AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.navigationBar.barTintColor = [UIColor clearColor];
//    self.navigationBar.translucent =NO;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
        /* 设置导航栏上面的内容 */
        // 设置左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
        
        // 设置右边的更多按钮
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
        
    }
    else
    {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(openOrCloseLeftList) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
        
        // 设置右边的更多按钮
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(twoDimensionalBarCode) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
    }
    
    [super pushViewController:viewController animated:animated];
}
/**
 *  当不是第一个控制器的时候返回按钮触发事件
 */
- (void)back
{
    // 因为self本来就是一个导航控制器，self.navigationController这里是nil的
    [self popViewControllerAnimated:YES];
}
//更多按钮触发事件
- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}
/**
 *  主页面抽屉
 */
- (void) openOrCloseLeftList
{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //判断当前状态抽屉是否是开启状态
    if (tempAppDelegate.LeftSlideVC.closed)
    {
        [tempAppDelegate.LeftSlideVC openLeftView];
    }
    else
    {
        [tempAppDelegate.LeftSlideVC closeLeftView];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
}
/**
 *  二维码
 */
-(void)twoDimensionalBarCode
{
    SubLBXScanViewController * svc = [[SubLBXScanViewController alloc]init];
    [self pushViewController:svc animated:YES];
}

@end
