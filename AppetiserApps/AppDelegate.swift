//
//  AppDelegate.swift
//  AppetiserApps
//
//  Created by Jovin Delfin on 11/10/19.
//  Copyright © 2019 JovElevin. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateInitialViewController() else { return true}
        //window?.rootViewController = DisDentsMovieController()
        window?.rootViewController = controller
        
        let name = UserDefaults.standard.string(forKey: "currentController")
        if name == "detail" {
            
            guard let controller = storyboard.instantiateViewController(identifier: "DetailVC") as? DetailViewController else { return true}
             
             self.window?.rootViewController?.present(UINavigationController(rootViewController: controller), animated: true, completion:nil)
        }
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

