//
//  TabBar.m
//  框架
//
//  Created by 刘明 on 16/3/21.
//  Copyright © 2016年 LM. All rights reserved.
//

#import "TabBar.h"

@implementation TabBar
/**
 *  重写layoutSubviews自定义布局
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count = self.subviews.count;
    
    Class class = NSClassFromString(@"UITabBarButton");
    for (int i = 0; i < count; i++) {
        UIView * view = self.subviews[i];
        
        if ([view isKindOfClass:class]) {
            view.width = WIDTH/4;
        }
    }
}

@end
