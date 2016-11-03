//
//  Test3ViewController.m
//  框架
//
//  Created by 刘明 on 16/3/21.
//  Copyright © 2016年 LM. All rights reserved.
//

#import "Test3ViewController.h"
#import "TempViewController.h"
@interface Test3ViewController ()

@end

@implementation Test3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



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
