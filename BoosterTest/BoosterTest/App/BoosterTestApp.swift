//
//  BoosterTestApp.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 24/05/2019.
//

import UIKit
import System

@UIApplicationMain
class BoosterTestApp: UIResponder, UIApplicationDelegate {
  let window = UIWindow(frame: UIScreen.main.bounds)
  private let appRouter = BoosterAppRouter()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    StartupProcessService()
      .execute(process: AppearanceCustomisationStartupProcess())
    
    window.rootViewController = appRouter.initialViewController()
    window.makeKeyAndVisible()
    
    return true
  }
  
  func applicationWillResignActive(_ application: UIApplication) { }
  
  func applicationDidEnterBackground(_ application: UIApplication) { }
  
  func applicationWillEnterForeground(_ application: UIApplication) { }
  
  func applicationDidBecomeActive(_ application: UIApplication) { }
  
  func applicationWillTerminate(_ application: UIApplication) { }
}
