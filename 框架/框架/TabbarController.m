//
//  TabbarController.m
//  框架
//
//  Created by 刘明 on 16/3/21.
//  Copyright © 2016年 LM. All rights reserved.
//

#import "TabbarController.h"
#import "HomeViewController.h"
#import "Test2ViewController.h"
#import "Test3ViewController.h"
#import "Test4ViewController.h"
#import "NavigationController.h"
#import "TabBar.h"
@interface TabbarController ()<UITabBarDelegate>
@property(weak,nonatomic)TabBar *tab;
@end
@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];

    //添加主页控制器
    HomeViewController * homeVC = [[HomeViewController alloc]init];
    [self addChildVC:homeVC andTitle:@"首页" andImage:@"tabbar_home" andSelectedImage:@"tabbar_home_selected"];

    
    //添加测试2控制器
    Test2ViewController* test2 = [[Test2ViewController alloc]init];
    [self addChildVC:test2 andTitle:@"测试2" andImage:@"tabbar_home" andSelectedImage:@"tabbar_home_selected"];
    
    //添加测试三控制器
    Test3ViewController* test3 =[[Test3ViewController alloc]init];
    [self addChildVC:test3 andTitle:@"测试3" andImage:@"tabbar_home" andSelectedImage:@"tabbar_home_selected"];
    
    //添加测试4控制器
    Test4ViewController* test4 = [[Test4ViewController alloc]init];
    [self addChildVC:test4 andTitle:@"测试4" andImage:@"tabbar_home" andSelectedImage:@"tabbar_home_selected"];
    
    
    TabBar *tab =  [[TabBar alloc]init];
    tab.delegate = self;
    //添加自定义tabbar
    [self setValue:tab forKey:@"tabBar"];
    
    self.tab =tab;
    
    tab.barTintColor = [UIColor colorWithRed:0/255.0 green:255/255.0 blue:255/255.0 alpha:0.1];
    tab.translucent =NO;
        self.selectedIndex = 2;
    

}
#pragma mark -添加控制器
/**
 *  添加一个控制器
 *
 *  @param childVc       传入的控制器
 *  @param title         传入的title
 *  @param image         非选中时的图片
 *  @param selectedImage 选中时的图片
 */
-(void)addChildVC:(UIViewController * )childVc andTitle:(NSString* )title andImage:(NSString *)image andSelectedImage:(NSString *)selectedImage
{
    //设置tabbar的文字
    childVc.title = title;
    //设置默认图片

    
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    //设置选中图片
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    //创建一个NavigationController
    NavigationController * nav = [[NavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}




@end
