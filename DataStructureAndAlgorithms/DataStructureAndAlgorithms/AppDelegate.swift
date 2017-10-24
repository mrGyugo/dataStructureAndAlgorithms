//
//  AppDelegate.swift
//  DataStructureAndAlgorithms
//
//  Created by Mac_Work on 24.10.17.
//  Copyright © 2017 Mac_Work. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        var myStack: Stack = [4, 5, 6, 7]
        let _ = myStack.pop()
        
        for number in myStack {
            print(number)
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.backgroundColor = UIColor.white
            window.rootViewController = UIViewController()
            window.makeKeyAndVisible()
        }
        return true
    }
}

