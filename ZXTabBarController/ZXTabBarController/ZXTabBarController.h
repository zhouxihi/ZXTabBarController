//
//  ZXTabBarController.h
//  ZXTabBarController
//
//  Created by Jackey on 2016/12/14.
//  Copyright © 2016年 com.zhouxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXTabBar.h"

@interface ZXTabBarController : UITabBarController

/**
 设所有子视图控制器
 */
- (void)setupChildViewControllers;

/**
 添加子视图控制器

 @param childVc 子视图控制器
 @param title 标题
 @param image 未选中时的图片
 @param selectedImage 选中时的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title Image:(NSString *)image \
selectedImage:(NSString *)selectedImage;

@end
