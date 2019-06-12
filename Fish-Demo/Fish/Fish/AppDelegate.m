//
//  AppDelegate.m
//  fish
//
//  Created by yuhao on 2019/6/11.
//  Copyright © 2019 yuhao. All rights reserved.
//

#import "AppDelegate.h"
#import "Common/AppConfig.h"
#import "ViewControllers/HomeViewController.h"
#import "ViewControllers/UserViewController.h"
#import "ViewControllers/MsgViewController.h"
#import "ViewControllers/PoundViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setupTabBar];
    return YES;
}

- (void)setupTabBar{
    
    HomeViewController *home = [[HomeViewController alloc] init];
    UINavigationController *navHome = [[UINavigationController alloc] initWithRootViewController:home];
    navHome.navigationBar.barTintColor = fishColor;
    [navHome.navigationBar setShadowImage:[UIImage new]];
    
    PoundViewController *pound = [[PoundViewController alloc] init];
        UINavigationController *navPound = [[UINavigationController alloc] initWithRootViewController:pound];
    navPound.navigationBar.barTintColor = fishColor;
    
    MsgViewController *msg = [[MsgViewController alloc] init];
        UINavigationController *navMsg = [[UINavigationController alloc] initWithRootViewController:msg];
    navMsg.navigationBar.barTintColor = fishColor;
    
    UserViewController *user = [[UserViewController alloc] init];
        UINavigationController *navUser = [[UINavigationController alloc] initWithRootViewController:user];
    navUser.navigationBar.barTintColor = fishColor;
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[navHome,navPound,navMsg,navUser];
    UITabBar *tabBar = tabBarController.tabBar;
    tabBar.backgroundColor = [UIColor whiteColor];
    

    UITabBarItem *homeItem = [tabBar.items objectAtIndex:0];
    homeItem.title = @"首页";
    homeItem.image = [UIImage imageNamed:@"tabbar-home"];
    
    UITabBarItem *poundItem = [tabBar.items objectAtIndex:1];
    poundItem.title = @"鱼塘";
    poundItem.image = [UIImage imageNamed:@"tabbar-pound"];
    
    UITabBarItem *msgItem = [tabBar.items objectAtIndex:2];
    msgItem.title = @"消息";
    msgItem.image = [UIImage imageNamed:@"tabbar-msg"];
    
    UITabBarItem *userItem = [tabBar.items objectAtIndex:3];
    userItem.title = @"我的";
    userItem.image = [UIImage imageNamed:@"tabbar-user"];
    
    self.window.tintColor = [UIColor blackColor];
    self.window.rootViewController=tabBarController;

    
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


@end
