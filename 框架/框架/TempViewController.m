//
//  TempViewController.m
//  框架
//
//  Created by 刘明 on 16/3/21.
//  Copyright © 2016年 LM. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *sw1;
@property (weak, nonatomic) IBOutlet UISwitch *sw2;
@property (weak, nonatomic) IBOutlet UISwitch *sw3;
@property (weak, nonatomic) IBOutlet UISwitch *sw4;
@property (weak, nonatomic) IBOutlet UISwitch *sw5;
- (IBAction)swClick:(UISwitch *)sender;


@end

@implementation TempViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.translucent = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationController. navigationBar setBackgroundImage:[UIImage imageNamed:@"bigShadow"] forBarMetrics:UIBarMetricsDefault];
}

- (IBAction)swClick:(UISwitch *)sender {
    
        self.sw1.on = sender.on;
        self.sw2.on = sender.on;
        self.sw3.on = sender.on;
        self.sw4.on = sender.on;
        self.sw5.on = sender.on;

    
}
@end
