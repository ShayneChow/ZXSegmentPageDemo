//
//  ZXOrderListController.h
//  ZXSegmentPageDemo
//
//  Created by Xiang on 16/2/26.
//  Copyright © 2016年 周想. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARSegmentPageController.h"

@interface ZXOrderListController : UIViewController<ARSegmentControllerDelegate, UITableViewDataSource, UITableViewDelegate>

/** 订单数据 */
@property (nonatomic, strong) NSMutableArray *orderArray;

@end
