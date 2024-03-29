//
//  AppDelegate.swift
//  CryptoCurrency
//
//  Created by Aakash Shah on 30/08/19.
//  Copyright © 2019 Aakash Shah. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc = CryptoCurrencyViewController()
        vc.cryptoViewModel = CryptoCurrencyViewModel()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        
        return true
    }

}
