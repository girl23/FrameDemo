//
//  MCAppDelegate.m
//  MicroClassroom
//
//  Created by wdwk on 2017/3/3.
//  Copyright © 2017年 wksc. All rights reserved.
//

#import "MCAppDelegate.h"
#import "GuideView.h"
#import "ViewController.h"
#import "MCReachabilityManager.h"

#import "MCTabBarViewController.h"
@interface MCAppDelegate()<GuideViewDelegate>

@end
@implementation MCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [[MCBasicDataManager shareInstance]fetchBasicData];
    
    [MCReachabilityManager shareReachabilityManager];
    [[UIApplication sharedApplication]setStatusBarHidden:NO];
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    NSString *guidedVersion = [[NSUserDefaults standardUserDefaults]stringForKey:APP_GUIDED_VERSION];
    //检测是否第一启动或是否有版本更新
    NSString * appVersion=APP_VERSION;
    if(guidedVersion == nil || ![guidedVersion isEqualToString:appVersion])
    {
        GuideView*guideView=[[GuideView alloc] init];
        guideView.delegate=self;
        [[NSUserDefaults standardUserDefaults] setObject:appVersion forKey:APP_GUIDED_VERSION];
        [_window setRootViewController:guideView];
        
    }else{
  
//        [MCBasicDataManager shareInstance];
//        [MCMineBasicDataManager shareInstance];

//        ViewController * VC=[ViewController new];
//        [_window setRootViewController:VC];
        MCTabBarViewController * tabbarController=[MCTabBarViewController new];
        [_window setRootViewController:tabbarController];
    }
    [_window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark gideViewDelegate
-(void)guideViewClickUseNowWithSelf:(GuideView *)guideView{
    
//    [MCBasicDataManager shareInstance];
//    [MCMineBasicDataManager shareInstance];
//    
//    _tabbarController = [self addTabbarViewController];
//    
//    [guideView presentViewController:_tabbarController animated:YES completion:^{
//        
//    }];

    MCTabBarViewController * tabbarController=[MCTabBarViewController new];
    [_window setRootViewController:tabbarController];
        [guideView presentViewController:tabbarController animated:YES completion:^{
    
        }];
    
}

@end
