//
//  ZXOrderListController.m
//  ZXSegmentPageDemo
//
//  Created by Xiang on 16/2/26.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "ZXOrderListController.h"
#import "ZXOrderCell.h"

@interface ZXOrderListController ()

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ZXOrderListController

static NSString * const cellID = @"ZXOrderCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZXOrderCell class]) bundle:nil] forCellReuseIdentifier:cellID];
}

- (NSString *)segmentTitle {
    return @"未支付";
}

- (UIScrollView *)streachScrollView {
    return _tableView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZXOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    return cell;
}

#pragma mark delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
