//
//  HomeViewController.m
//  框架
//
//  Created by 刘明 on 16/3/21.
//  Copyright © 2016年 LM. All rights reserved.
//

#import "HomeViewController.h"
#import "Test4ViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.translucent = YES;
//    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
//    [self.navigationController. navigationBar setBackgroundImage:[UIImage imageNamed:@"bigShadow"] forBarMetrics:UIBarMetricsCompact];
//    self.navigationController.navigationBar.clipsToBounds = YES;
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.navigationController.navigationBar lt_reset];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    


}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifer=@"cell";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifer];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d",arc4random_uniform(50)];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Test4ViewController * tempVC = [[Test4ViewController alloc]init];
    tempVC.title = @"tempVC";
//    self.navigationController.navigationBar.clipsToBounds = NO;
//    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"logo"] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController pushViewController:tempVC animated:YES];
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    [UIView animateWithDuration:1 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = [UIColor whiteColor];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 50) {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0.5]];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}

@end
