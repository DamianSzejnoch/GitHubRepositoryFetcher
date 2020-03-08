//
//  AppDelegate.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    private let window: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    private var diContainer = DIContainer.shared
    var appCoordinator: AppCoordinator?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13.0, *) {
            window.overrideUserInterfaceStyle = .light
        }
        appCoordinator = AppCoordinator(window: window, factory: diContainer)
        IQKeyboardManager.shared.enable = true
        appCoordinator?.start()
        window.rootViewController = appCoordinator?.controller
        window.makeKeyAndVisible()
        return true
    }
}

