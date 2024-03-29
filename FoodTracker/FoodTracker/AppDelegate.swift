//
//  AppDelegate.swift
//  FoodTracker
//
//  Created by Jonathon Fishman on 9/14/16.
//  Copyright © 2016 GoYoJo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Initialize BE at launch 
        BackendlessManager.sharedInstance.initApp()
        
        if BackendlessManager.sharedInstance.isUserLoggedIn() {
        
            // If the user is logged in - skip the login view and go straight to the meal list!
            
            // First make sure we are in the Main.storyboard
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            // Make sure to give starting scene a SB id in idin
            // Added the tab bar so we need to give the id to the tab bar scene
            self.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "tabBarController")
        }
        
        return true
    }
    
        func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        // If the user logs in via Facebook or Twitter, this code will handle the successful login.
        BackendlessManager.sharedInstance.handleOpen( open: url,
                                         
            completion: {
                
                // If the user is logged in - skip the login view and go straight the menu!
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                self.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "tabBarController")
            },
            
            error: {})

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

