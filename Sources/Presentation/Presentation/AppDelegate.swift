//
//  AppDelegate.swift
//  OpenWeather
//
//  Created by Rodrigo Andrade on 03/07/20.
//  Copyright © 2020 Rodrigo Andrade. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    internal var window: UIWindow?
    private var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        self.window = window
        let appCoordinator = AppCoordinator(window: window)
        self.appCoordinator = appCoordinator
        appCoordinator.start()
        
        return true
    }
}
