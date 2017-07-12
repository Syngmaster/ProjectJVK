//
//  AppDelegate.m
//  JVK
//
//  Created by Max&Viktoria on 13/02/2017.
//  Copyright © 2017 Max&Viktoria. All rights reserved.
//

#import "AppDelegate.h"
#import <Firebase.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [UINavigationBar appearance].barTintColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSFontAttributeName: [UIFont fontWithName:@"Optima" size:20],
                                                           }];
    
    UITabBarController *tabVC = (UITabBarController *)[UIApplication sharedApplication].windows.firstObject.rootViewController;
    [UITabBar appearance].backgroundImage = [self drawGradientInView:tabVC];

    [FIRApp configure];
    
    return YES;
}

- (UIImage *)drawGradientInView:(UITabBarController *) tabBarVC {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    gradient.frame = CGRectMake(CGRectGetMinX(tabBarVC.tabBar.frame), CGRectGetMinY(tabBarVC.tabBar.frame), CGRectGetWidth(tabBarVC.view.frame), CGRectGetHeight(tabBarVC.tabBar.frame));
    
    gradient.colors = @[(__bridge id)[UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor whiteColor].CGColor];
    gradient.startPoint = CGPointMake(0.0, 0.5);
    gradient.endPoint = CGPointMake(0.5, 0.5);
    
    UIGraphicsBeginImageContext(gradient.bounds.size);
    [gradient renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return gradientImage;
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
