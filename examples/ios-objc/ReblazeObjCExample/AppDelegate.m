//
//  AppDelegate.m
//  ReblazeObjCExample
//
//  Created by Rotem Doron on 10/11/2019.
//  Copyright © 2019-2021 Reblaze. All rights reserved.
//

#import "AppDelegate.h"
@import ReblazeSDK;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application

    [reblaze enableMock];
    reblaze.backendUrl = @"https://www.example.com";
    
    NSString *hash = [reblaze generateHash];

    if (hash != nil) {
        NSLog(@"ReblazeSDK v%.2f %@", ReblazeSDKVersionNumber, hash);
    }

    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
