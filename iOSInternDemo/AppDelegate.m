//
//  AppDelegate.m
//  iOSInternDemo
//
//  Created by jingsong.jn on 2019/5/27.
//  Copyright © 2019 jingsong.jn. All rights reserved.
//

#import "AppDelegate.h"
#import "TextViewController.h"
#import "MyTableViewController.h"
#import "QuizViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    
    TextViewController *viewController = [[TextViewController alloc] init];
    viewController.tabBarItem.title = @"游戏";
    
    MyTableViewController *tableViewController = [[MyTableViewController alloc] init];
    tableViewController.tabBarItem.title = @"列表";
    
    QuizViewController *quizViewController = [[QuizViewController alloc] init];
    quizViewController.tabBarItem.title = @"问答";
    
    UIViewController *controller4 = [[UIViewController alloc] init];
    controller4.view.backgroundColor = [UIColor whiteColor];
    controller4.tabBarItem.title = @"我的";

    
    [tabbarController setViewControllers:@[viewController,tableViewController,quizViewController,controller4]];
    
    tabbarController.delegate = self;
    
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    
    navigationController.navigationItem.title = @"xx";
    
    self.window.rootViewController = navigationController;
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"didSelectViewController");
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
