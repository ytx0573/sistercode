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
    LoginViewController * loginVC =[[LoginViewController alloc] init];
    
    _window.rootViewController = tabBarController;
    
    /**层次工具*/
    [[FLEXManager sharedManager] showExplorer];
    
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
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "rimi.LVDIRenMaiManage" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"LVDIRenMaiManage" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"LVDIRenMaiManage.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
