//
//  Test4ViewController.m
//  框架
//
//  Created by 刘明 on 16/3/21.
//  Copyright © 2016年 LM. All rights reserved.
//

#import "Test4ViewController.h"
#import "TempViewController.h"

@interface Test4ViewController ()

@end

@implementation Test4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
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
    TempViewController * tempVC = [[TempViewController alloc]init];
    tempVC.title = @"tempVC";
    [self.navigationController pushViewController:tempVC animated:YES];
}
@end
