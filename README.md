# ZXTabBarController
模仿咸鱼写的一个TabBarController框架

![image](https://github.com/zhouxihi/ZXTabBarController/raw/master/ZXTabBarSCreenDemo.png)
##使用方法将ZXTabBarController文件夹拖入项目中, 然后添加自己的子控制器.再修改下初始化代码就可以了
##pragma mark - 设置子视图控制器方法
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
