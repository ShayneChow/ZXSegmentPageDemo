//
//  ZXSemgentViewController.m
//  ZXSegmentPageDemo
//
//  Created by Xiang on 16/2/26.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "ZXSemgentViewController.h"
#import "ZXHeaderView.h"
#import "ZXOrderListController.h"

void *ZXSemgentInsetObserver = &ZXSemgentInsetObserver;

@interface ZXSemgentViewController ()

/** 头部视图 */
@property (strong, nonatomic) ZXHeaderView *_headerView;

@end

@implementation ZXSemgentViewController

-(instancetype)init {
    ZXOrderListController *unpayOrderListVC = [[ZXOrderListController alloc] init];
    ZXOrderListController *doneOrderListVC = [[ZXOrderListController alloc] init];
    
    
    self = [super initWithControllers:unpayOrderListVC, doneOrderListVC, nil];
    if (self) {
        // your code
        self.segmentMiniTopInset = 64;
    }
    
    return self;
}

-(UIView *)customHeaderView {
    if (__headerView == nil) {
        __headerView = [[[NSBundle mainBundle] loadNibNamed:@"ZXHeaderView" owner:nil options:nil] lastObject];
        __headerView.backgroundColor = [UIColor redColor];
    }
    return __headerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Segment";
    [self addObserver:self forKeyPath:@"segmentTopInset" options:NSKeyValueObservingOptionNew context:ZXSemgentInsetObserver];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    if (context == ZXSemgentInsetObserver) {
//        CGFloat inset = [change[NSKeyValueChangeNewKey] floatValue];
//        [self.header updateHeadPhotoWithTopInset:inset];
        NSLog(@"observeValueForKeyPath:");
    }
}

-(void)dealloc {
    [self removeObserver:self forKeyPath:@"segmentTopInset"];
}

@end
