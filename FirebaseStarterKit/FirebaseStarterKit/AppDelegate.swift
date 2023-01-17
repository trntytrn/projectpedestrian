//
//  AppDelegate.swift
//  FirebaseStarterKit
//
//  Created by Florian Marcu on 1/28/23.
//  Copyright © 2023 Instamobile. All rights reserved.
//

import Firebase
import UIKit
import GoogleMaps
import GooglePlaces
import UserNotifications
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let pushManager = PushNotificationManager(userID: "currently_logged_in_user_id")
        pushManager.registerForPushNotifications()
        GMSServices.provideAPIKey("AIzaSyA4aPnHKt9PSXdp7LvzcJGeHDT3g-edHvw")
        GMSPlacesClient.provideAPIKey("AIzaSyBac7bAaxKMEoqYZnrBZRxHJc85gDZx6PQ")
    
        FirebaseApp.configure()

        let sender = PushNotificationSender()
        sender.sendPushNotification(to: "token", title: "Notification title", body: "Notification body")

//        window = UIWindow(frame: UIScreen.main.bounds)
//
//        // Set up the first View Controller
//        let vc1 = MapViewController()
//        vc1.tabBarItem.title = "Map"
//        vc1.tabBarItem.image = UIImage(named: "map")
//        vc1.view.backgroundColor = UIColor.clear
//
//
//        // Set up the second View Controller
//        let vc2 = SettingsTabViewController()
//        vc2.tabBarItem.title = "Settings"
//        vc2.tabBarItem.image = UIImage(named: "gearshape")
//        vc2.view.backgroundColor = UIColor.clear
//
//
//        // Set up the second View Controller
//        let vc3 = AboutTabViewController()
//        vc3.tabBarItem.title = "About"
//        vc3.tabBarItem.image = UIImage(named: "questionmark")
//        vc3.view.backgroundColor = UIColor.clear
//
//
//        // Set up the Tab Bar Controller to have two tabs
//        let tabBarController = UITabBarController()
//        tabBarController.viewControllers = [vc3, vc1, vc2]
//        tabBarController.selectedViewController = vc1
//        tabBarController.selectedIndex = 1
//        UITabBar.appearance().backgroundColor = UIColor(named: "ppnavy")
//        UITabBar.appearance().tintColor = UIColor(named: "ppgreen")
//        UITabBar.appearance().unselectedItemTintColor = .black
//
//        // Make the Tab Bar Controller the root view controller
//        window?.rootViewController = tabBarController
//        window?.makeKeyAndVisible()
        
        return true
        
    }
    
}

