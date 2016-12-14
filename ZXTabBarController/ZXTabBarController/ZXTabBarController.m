//
//  ZXTabBarController.m
//  ZXTabBarController
//
//  Created by Jackey on 2016/12/14.
//  Copyright © 2016年 com.zhouxi. All rights reserved.
//

#import "ZXTabBarController.h"
#import "HomeViewController.h"
#import "RecognizeViewController.h"
#import "MessageViewController.h"
#import "PersonalViewController.h"
#import "ZXNavigationController.h"
#import "ZXTabBar.h"

@interface ZXTabBarController () <ZXTabBarDelegate>

@end

@implementation ZXTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //设置子视图控制器
    [self setupChildViewControllers];
    
    //替换TabBar
    ZXTabBar *zxTabBar = [[ZXTabBar alloc] init];
    [self setValue:zxTabBar forKeyPath:@"tabBar"];
    
}

#pragma mark - 设置子视图控制器方法
- (void)setupChildViewControllers {
    
    //添加子视图控制器
    [self addChildVc:[[HomeViewController alloc] init]
               title:@"首页"
               Image:@"home_normal"
       selectedImage:@"home_highlight"];
    
    [self addChildVc:[[RecognizeViewController alloc] init]
               title:@"随拍"
               Image:@"reco_normal"
       selectedImage:@"rec_highlight"];
    
    [self addChildVc:[[MessageViewController alloc] init]
               title:@"消息"
               Image:@"message_normal"
       selectedImage:@"message_highlight"];
    
    [self addChildVc:[[PersonalViewController alloc] init]
               title:@"我的"
               Image:@"account_normal"
       selectedImage:@"account_highlight"];
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title Image:(NSString *)image
     selectedImage:(NSString *)selectedImage {
    
    //设置子控制器
    childVc.title = title;
    childVc.tabBarItem.title = title;
    
    [childVc.tabBarItem setImage:[[UIImage imageNamed:image]
          imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [childVc.tabBarItem setSelectedImage:[[UIImage imageNamed:selectedImage]
                  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //初始化ZXNavigationController
    ZXNavigationController *navController = [[ZXNavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:navController];
}

#pragma mark - ZXTabBarDelegate method
- (void)tabBarDidClickPlusButton:(ZXTabBar *)tabBar {
    
    NSLog(@"点击了加号按钮");
}

@end
