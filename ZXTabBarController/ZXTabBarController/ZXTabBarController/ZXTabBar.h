//
//  ZXTabBar.h
//  ZXTabBarController
//
//  Created by Jackey on 2016/12/14.
//  Copyright © 2016年 com.zhouxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXTabBar;

/**
 自定义TabBarDelegate
 */
@protocol ZXTabBarDelegate <UITabBarDelegate>

@optional

/**
 加号按钮协议方法

 @param tabBar ZXTabBar实例
 */
- (void)tabBarDidClickPlusButton:(ZXTabBar *)tabBar;

@end

@interface ZXTabBar : UITabBar

/**
 协议对象
 */
@property (nonatomic, weak) id<ZXTabBarDelegate> delegate;

/**
 加号按钮
 */
@property (nonatomic, weak) UIButton *plusBtn;

/**
 初始化方法

 @return 返回生成的UITabBar
 */
- (id)init;

/**
 加号按钮事件
 */
- (void)plusBtnClick;

@end
