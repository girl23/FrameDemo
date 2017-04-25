//
//  MCTabBarViewController.m
//  MicroClassroom
//
//  Created by wdwk on 2017/3/6.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import "MCTabBarViewController.h"

#import "WLFirstViewController.h"
#import "WLSecondViewController.h"
#import "WLThirdViewController.h"
#import "WLFourthViewController.h"
#import "ViewController.h"
#import "MCTabBar.h"
#import "MCNavigationController.h"
#import "MSSlideNavigationController.h"
@interface MCTabBarViewController ()<MCTabBarDelegate>
@property (nonatomic, weak) MCTabBar *customTabBar;
@end

@implementation MCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTabBar];
    [self setupAllChildViewControllers];
    //    [self.customTabBar.middleBtn addTarget:self action:@selector(midBtn) forControlEvents:UIControlEventTouchUpInside];
}
// 中间按钮的点击方法
//- (void)midBtn {
//    NSLog(@"你点我干嘛呢？啊啊啊");
//}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
- (void)setTabBar {
    MCTabBar *customTabBar = [MCTabBar new];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}
- (void)tabBar:(MCTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to {
    self.selectedIndex = to;
}
- (void)setupAllChildViewControllers {
    WLFirstViewController *firstVC = [WLFirstViewController new];
    [self setupChildViewController:firstVC title:@"笔记" imageName:@"笔记" selectedImageName:@"笔记_selected"];
    
    WLSecondViewController *secondVC = [WLSecondViewController new];
    [self setupChildViewController:secondVC title:@"文件夹" imageName:@"文件夹" selectedImageName:@"文件夹_selected"];
    
    WLThirdViewController *thirdVC = [WLThirdViewController new];
    [self setupChildViewController:thirdVC title:@"标签" imageName:@"标签" selectedImageName:@"标签_selected"];
    
    WLFourthViewController *fourthVC = [WLFourthViewController new];
    [self setupChildViewController:fourthVC title:@"搜索" imageName:@"搜索" selectedImageName:@"搜索_selected"];
    
    ViewController *fiveVC = [ViewController new];
    [self setupChildViewController:fiveVC title:@"搜索" imageName:@"搜索" selectedImageName:@"搜索_selected"];
    ViewController *fiveVC1 = [ViewController new];
    [self setupChildViewController:fiveVC1 title:@"搜索" imageName:@"搜索" selectedImageName:@"搜索_selected"];
    
}
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage *selectedIamge = [UIImage imageNamed:selectedImageName];
    childVc.tabBarItem.selectedImage = [selectedIamge imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UINavigationController * navVc=[[UINavigationController alloc]initWithRootViewController:childVc];
    MSSlideNavigationController *navVc = [[MSSlideNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:navVc];
    [self.customTabBar addTabBarButtonItem:childVc.tabBarItem];
}
@end
