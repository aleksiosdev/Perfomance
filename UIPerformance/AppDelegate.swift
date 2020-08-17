//
//  AppDelegate.swift
//  UIPerformance
//
//  Created by Sergey Pronin on 8/9/20.
//  Copyright © 2020 Sergey Pronin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow? = UIWindow()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FPSCounter.showInStatusBar(window: window!)
        
//        window?.rootViewController = TextureViewController()
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        window?.rootViewController = storyboard.instantiateInitialViewController()
        
        
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle
}

