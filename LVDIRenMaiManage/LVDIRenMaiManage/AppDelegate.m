//
//  AppDelegate.m
//  LVDIRenMaiManage
//
//  Created by rimi on 15-1-5.
//  Copyright (c) 2015年 Yangxiaofen. All rights reserved.
//

#define API_URL @"http://125.70.10.34:8119/ggc/api.php"
#import "AppDelegate.h"
#import "ViewController.h"
#import "TabBarViewController.h"

#import "WodeRenMaiViewController.h"
#import "RenMaiKuViewController.h"
#import "KeNengViewController.h"
#import "TianJiaGuanXiViewController.h"
#import "GuanyuViewController.h"

#import "LoginViewController.h"


#import "FLEXManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%@",NSHomeDirectory());
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    WodeRenMaiViewController * wodeRenMaiview = [[WodeRenMaiViewController alloc]init];
    UINavigationController * wodeRenMaiNavc = [[UINavigationController alloc] initWithRootViewController:wodeRenMaiview];
    wodeRenMaiNavc.navigationBarHidden = YES;
    RenMaiKuViewController * renMaiKuView = [[RenMaiKuViewController alloc]init];
    UINavigationController * renMaiKuNavc = [[UINavigationController alloc] initWithRootViewController:renMaiKuView];
    renMaiKuNavc.navigationBarHidden = YES;
    KeNengViewController * keNengView = [[KeNengViewController alloc]init];
    UINavigationController * keNengNavc = [[UINavigationController alloc] initWithRootViewController:keNengView];
    keNengNavc.navigationBarHidden = YES;
    TianJiaGuanXiViewController * tianjiaGuanXiView = [[TianJiaGuanXiViewController alloc]init];
    UINavigationController * tianJiaGuanxiNavc = [[UINavigationController alloc] initWithRootViewController:tianjiaGuanXiView];
    tianJiaGuanxiNavc.navigationBarHidden = YES;
    GuanyuViewController * guanyuView = [[GuanyuViewController alloc]init];
    UINavigationController * guanYuNavc = [[UINavigationController alloc] initWithRootViewController:guanyuView];
    guanYuNavc.navigationBarHidden = YES;
    
    TabBarViewController * tabBarController = [[TabBarViewController alloc] init];
    tabBarController.viewControllers = @[wodeRenMaiNavc,renMaiKuNavc,keNengNavc,tianJiaGuanxiNavc,guanYuNavc];
    _window.rootViewController = tabBarController;
    
    /**层次工具*/
    [[FLEXManager sharedManager] showExplorer];
    
    NSLog(@"test commit ");
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
