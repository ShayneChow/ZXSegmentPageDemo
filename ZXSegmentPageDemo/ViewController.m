//
//  ViewController.m
//  ZXSegmentPageDemo
//
//  Created by Xiang on 16/2/26.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "ViewController.h"
#import "ZXSemgentViewController.h"

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

- (IBAction)goToSegmentPageVC {
    ZXSemgentViewController *demoVC = [[ZXSemgentViewController alloc] init];
    [self.navigationController pushViewController:demoVC animated:YES];
}

@end
