//
//  ZXTabBar.m
//  ZXTabBarController
//
//  Created by Jackey on 2016/12/14.
//  Copyright © 2016年 com.zhouxi. All rights reserved.
//

#import "ZXTabBar.h"
#import "UIImage+Image.h"

@implementation ZXTabBar

@synthesize delegate;
@synthesize plusBtn;

- (id)init {
    
    self = [super init];
    if (self) {
        
        //设置tabBar颜色背景
        self.tintColor       = [UIColor grayColor];
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];
        
        //设置plusBtn
        UIButton *btn = [[UIButton alloc] init];
        
        //设置背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"plus_normal"]
                       forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"plus_normal"]
                       forState:UIControlStateHighlighted];
        
        
        //设置button事件
        [btn addTarget:self action:@selector(plusBtnClick)
      forControlEvents:UIControlEventTouchUpInside];
        
        plusBtn = btn;
        [self addSubview:plusBtn];
    }
    
    return self;
}

- (void)plusBtnClick {
    
    //通知代理去处理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        
        [self.delegate tabBarDidClickPlusButton:self];
    }
}

//重写layoutSubviews方法调整布局
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    //调整plus按钮的位置
    CGRect plusFrame = plusBtn.frame;
    plusFrame.size = plusBtn.currentBackgroundImage.size;
    plusFrame.origin.x = self.frame.size.width / 2 - plusBtn.currentBackgroundImage.size.width / 2;
    plusFrame.origin.y = - plusBtn.currentBackgroundImage.size.height / 3;
    plusBtn.frame = plusFrame;
    
    //增加发布Lable
    UILabel *lable  = [[UILabel alloc] init];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text      = @"发布";
    lable.font      = [UIFont systemFontOfSize:11];
    lable.textColor = [UIColor grayColor];
    
    //自动调整大小
    [lable sizeToFit];
    
    //调整lable位置
    CGRect frame   = lable.frame;
    frame.origin.x = self.frame.size.width / 2 - frame.size.width / 2;
    frame.origin.y = self.frame.size.height - frame.size.height;
    lable.frame    = frame;
    
    [self addSubview:lable];
    
    //设置其他tabBarButton的frame
    CGFloat tabBarButtonWidth = self.frame.size.width / 5;
    CGFloat tabBarButtonIndex = 0;
    
    Class class = NSClassFromString(@"UITabBarButton");
    
    for (UIView *child in self.subviews) {
        
        if ([child isKindOfClass:class]) {
            
            //设置frame
            CGRect frame     = child.frame;
            frame.origin.x   = tabBarButtonIndex * tabBarButtonWidth;
            frame.size.width = tabBarButtonWidth;
            child.frame      = frame;
            
            //增加索引
            tabBarButtonIndex++;
            if (tabBarButtonIndex == 2) {
                
                tabBarButtonIndex++;
            }
        }
    }
}

//重写hitTest方法, 让tabBar突出部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    //当TabBar没有隐藏时
    if (self.hidden == NO) {
        
        //将触摸点转换到plusBtn坐标系上
        CGPoint newPoint = [self convertPoint:point toView:self.plusBtn];
        
        //判断触摸点是否在plusBtn上面
        if ([self.plusBtn pointInside:newPoint withEvent:event]) {
            
            //在plusBtn上就让plusbtn去响应
            return self.plusBtn;
        } else {
            
            //否则交由系统自己决定由谁响应
            return [super hitTest:point withEvent:event];
        }
    }
    
    else {
        
        //当tabBar隐藏时交由系统决定由谁响应
        return [super hitTest:point withEvent:event];
    }
    
}

@end
