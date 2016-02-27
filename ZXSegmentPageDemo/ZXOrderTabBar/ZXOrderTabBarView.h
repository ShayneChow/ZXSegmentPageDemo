//
//  ZXOrderTabBarView.h
//  ZXSegmentPageDemo
//
//  Created by Xiang on 16/2/27.
//  Copyright © 2016年 周想. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXOrderTabBarView;

@protocol ZXOrderTabBarViewDelegate <NSObject>

@optional
-(void)tabBar:(ZXOrderTabBarView *)tabBar didSelectIndex:(NSInteger)index;

@end

@interface ZXOrderTabBarView : UIView

@property (nonatomic, weak) id<ZXOrderTabBarViewDelegate> delegate;

/**
 静态方法初始化
 */
+ (instancetype)tabbar;

/**
 使用数组初始化
 */
- (instancetype)initWithArray:(NSArray*)array;
- (void)AddTarBarBtn:(NSString *)name;//添加顶部标题项的名字
- (void)TabBtnClick:(UIButton *)sender;//监听tabbar的点击


@end
