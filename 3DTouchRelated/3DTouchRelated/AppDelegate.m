//
//  AppDelegate.m
//  3DTouchRelated
//
//  Created by 梁天 on 16/9/28.
//  Copyright © 2016年 haibao. All rights reserved.
//

#import "AppDelegate.h"
#import "NewViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self registeShortCutItems];
    
    return YES;
}

- (void)registeShortCutItems {
    // UIApplicationShortcutItem 代表一个item
    // type： 唯一标示符的属性
    // localizedTitle: 显示的标题
    // localizedSubtitle: 显示的二级标题
    // icon：显示的图片，可以自定义，也可以使用系统提供的样式
    // userInfo: 包含一些信息
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc]initWithType:@"test" localizedTitle:@"Title" localizedSubtitle:@"Sub Title" icon:[UIApplicationShortcutIcon iconWithTemplateImageName:@"sad"] userInfo:nil];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc]initWithType:@"test" localizedTitle:@"标题"];
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc]initWithType:@"test1" localizedTitle:@"嘻嘻哈哈好长啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊" localizedSubtitle:@"嘻嘻哈哈好长啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeTime] userInfo:nil];
    [UIApplication sharedApplication].shortcutItems = @[item1,item2,item3];
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    if ([shortcutItem.type isEqualToString:@"test"]) {
        NSLog(@"哈哈哈");
    }else if ([shortcutItem.type isEqualToString:@"test1"]) {
        NSLog(@"呵呵呵");
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:[[NewViewController alloc]init] animated:YES completion:nil];
    }
    //completionHandler怎么用不清楚
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
