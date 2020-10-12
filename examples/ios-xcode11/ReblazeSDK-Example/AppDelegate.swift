//
//  AppDelegate.swift
//  ReblazeSDK-Example
//
//  Created by Rotem Doron on 06/05/2019.
//  Copyright © 2019 Reblaze. All rights reserved.
//

import UIKit
import ReblazeSDK


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        do {
            try Reblaze.configure(secret: "08679d101bb5d41sdj4321b15asdfe8", uid: "test@123.io")

        } catch let error {
            print((error as? LocalizedError)?.errorDescription as Any)
        }
        
        //Call get hash only after Reblaze.start is called
        do {
            try Reblaze.start(with: "server_url",
                              secret: "secret",
                              key: "user_name",
                              uid: "user_id",
                              shouldShowLogs: true,
                              intervalInSeconds: 20,
                              userAgent: "user_agent",
                              reportLocation: false)
            
            let hash = try Reblaze.getHash(unixTimestamp: Int(Date().timeIntervalSince1970.rounded()))
            print(hash)
        } catch let error {
            print(error)
        }
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

