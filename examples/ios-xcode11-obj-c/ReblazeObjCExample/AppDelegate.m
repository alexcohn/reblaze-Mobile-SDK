//
//  AppDelegate.m
//  ReblazeObjCExample
//
//  Created by Rotem Doron on 10/11/2019.
//  Copyright © 2019 Reblaze. All rights reserved.
//

#import "AppDelegate.h"
@import ReblazeSDK;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application

    [Reblaze configureWithSecret:@"08679d101bb5d41sdj4321b15asdfe4"
                                uid:@"test@123.io"
                              error: nil];
    
    NSError *startError = nil;
    [Reblaze startWith:@"server_url"
                secret:@"secret"
                   key:@"user_name"
                   uid:@"user_id"
        shouldShowLogs:YES
     intervalInSeconds: 15
        reportLocation: false
                 error: &startError];
    
    if (startError!= nil) {
         NSLog(@"%@", startError);
    }
    
    NSTimeInterval timestamp = [[[NSDate alloc] init] timeIntervalSince1970];
    NSError *error = nil;
    NSString *hash = [Reblaze getHashWithUnixTimestamp:timestamp error: &error];

    if (hash != nil) {
        NSLog(@"%@", hash);
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
