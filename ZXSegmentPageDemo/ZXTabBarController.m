//
//  ZXTabBarController.m
//  ZXSegmentPageDemo
//
//  Created by Xiang on 16/2/27.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "ZXTabBarController.h"
#import "ZXOrderTabBarView.h"
#import "ZXUIViewTool.h"
#import "ZXOrderCell.h"

@interface ZXTabBarController () <UITableViewDelegate, UITableViewDataSource, ZXOrderTabBarViewDelegate>

@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UIView *orderTableView;

@property (strong, nonatomic) UITableView *unpayOrderTableView;
@property (strong, nonatomic) UITableView *doneOrderTableView;
@property (strong, nonatomic) UITableView *cancelOrderTableView;

@end

@implementation ZXTabBarController

static NSString * const cellID = @"ZXOrderCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"TabBar";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc] init];
    _headerView = view;
    view.frame = CGRectMake(0, 0, screenW, 250.0);
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
    
    //初始化顶部导航标题
    NSArray* array  = @[@"未完成", @"已完成", @"已取消"];
    ZXOrderTabBarView* tabBar = [[ZXOrderTabBarView alloc] initWithArray:array] ;
    tabBar.frame = CGRectMake(0, 250.0, screenW, 50.0);
    tabBar.backgroundColor = [UIColor whiteColor];
    tabBar.delegate = self;
    [self.view addSubview:tabBar];
    
    //初始化一个UITableView
    
    _orderTableView = [[UIView alloc] initWithFrame:CGRectMake(0, 300.0, screenW, screenH - 300.0)];
    
//    [tableview registerNib:[UINib nibWithNibName:NSStringFromClass([ZXOrderCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
    [self.view addSubview:_orderTableView];
    
    [self tabBar:tabBar didSelectIndex:0];
}

- (UITableView *)unpayOrderTableView {
    if (nil == _unpayOrderTableView) {
        _unpayOrderTableView = [[UITableView alloc] initWithFrame:_orderTableView.frame];
        _unpayOrderTableView.backgroundColor = [UIColor whiteColor];
        _unpayOrderTableView.delegate = self;
        _unpayOrderTableView.dataSource = self;
        _unpayOrderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_unpayOrderTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZXOrderCell class]) bundle:nil] forCellReuseIdentifier:cellID];
        [self.view addSubview:_unpayOrderTableView];
    }
    return _unpayOrderTableView;
}

- (UITableView *)doneOrderTableView {
    if (nil == _doneOrderTableView) {
        _doneOrderTableView = [[UITableView alloc] initWithFrame:_orderTableView.frame];
        _doneOrderTableView.backgroundColor = [UIColor whiteColor];
        _doneOrderTableView.delegate = self;
        _doneOrderTableView.dataSource = self;
        _doneOrderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_doneOrderTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZXOrderCell class]) bundle:nil] forCellReuseIdentifier:cellID];
       [self.view addSubview:_doneOrderTableView];
    }
    return _doneOrderTableView;
}

- (UITableView *)cancelOrderTableView {
    if (nil == _cancelOrderTableView) {
        _cancelOrderTableView = [[UITableView alloc] initWithFrame:_orderTableView.frame];
        _cancelOrderTableView.backgroundColor = [UIColor whiteColor];
        _cancelOrderTableView.delegate = self;
        _cancelOrderTableView.dataSource = self;
        _cancelOrderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_cancelOrderTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZXOrderCell class]) bundle:nil] forCellReuseIdentifier:cellID];
        [self.view addSubview:_cancelOrderTableView];
    }
    return _cancelOrderTableView;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _unpayOrderTableView) {
        return 20;
    } else if (tableView == _doneOrderTableView) {
        return 10;
    } else {
        return 5;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZXOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (tableView == _unpayOrderTableView) {
        cell.haveDoneIconView.hidden = YES;
        cell.goCheckButton.hidden = NO;
    } else if (tableView == _doneOrderTableView) {
        cell.haveDoneIconView.hidden = NO;
        cell.goCheckButton.hidden = YES;
    } else {
        cell.haveDoneIconView.hidden = YES;
        [cell.goCheckButton setTitle:@"已取消" forState:UIControlStateNormal];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120.0;
}

#pragma mark - ZXOrderTabBarViewDelegate
- (void)tabBar:(ZXOrderTabBarView *)tabBar didSelectIndex:(NSInteger)index {
    NSLog(@"点击了 －－－ %ld",index);
    if (index == 0) {
        [self unpayOrderTableView];
        //_orderTableView = _unpayOrderTableView;
        [_unpayOrderTableView reloadData];
    } else if (index == 1) {
        [self doneOrderTableView];
        //_orderTableView = _doneOrderTableView;
        [_doneOrderTableView reloadData];
    } else {
        [self cancelOrderTableView];
        //_orderTableView = _cancelOrderTableView;
        [_cancelOrderTableView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
