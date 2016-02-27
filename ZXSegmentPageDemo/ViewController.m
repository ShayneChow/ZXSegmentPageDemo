//
//  ViewController.m
//  ZXSegmentPageDemo
//
//  Created by Xiang on 16/2/26.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "ViewController.h"
#import "ZXSemgentViewController.h"
#import "ZXTabBarController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 方案1
- (IBAction)goToSegmentPageVC {
    ZXSemgentViewController *demoVC = [[ZXSemgentViewController alloc] init];
    [self.navigationController pushViewController:demoVC animated:YES];
}

// 方案2
- (IBAction)goToTabBarVC {
    ZXTabBarController *tabBarVC = [[ZXTabBarController alloc] init];
    [self.navigationController pushViewController:tabBarVC animated:YES];
}

@end
