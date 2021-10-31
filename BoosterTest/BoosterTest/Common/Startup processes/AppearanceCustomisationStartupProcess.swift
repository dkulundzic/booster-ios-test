//
//  AppearanceCustomisationStartupProcess.swift
//  LiveM
//
//  Created by Domagoj Kulundzic on 23/06/2020.
//  Copyright © 2020 Codeopolis. All rights reserved.
//

import Foundation
import UIKit
import System

final class AppearanceCustomisationStartupProcess: StartupProcess {
  func run(completion: @escaping (Bool) -> Void) {
    customiseTabBar()
    customiseNavigationBar()
    customiseOther()
    completion(true)
  }
}

private extension AppearanceCustomisationStartupProcess {
  func customiseTabBar() {
    let font = UIFont.systemFont(ofSize: 12, weight: .medium)
    
    func updateItemAppearance(for appearance: UITabBarItemAppearance) {
      let selectedColor = Colors.General.purple.color
      appearance.selected.iconColor = selectedColor
      appearance.selected.badgeBackgroundColor = selectedColor
      appearance.selected.titleTextAttributes = [
        NSAttributedString.Key.font: font as Any,
        NSAttributedString.Key.foregroundColor: selectedColor as Any
      ]
      
      let normalColor = UIColor.lightGray
      appearance.normal.iconColor = normalColor
      appearance.normal.badgeBackgroundColor = normalColor
      appearance.normal.titleTextAttributes = [
        NSAttributedString.Key.font: font as Any,
        NSAttributedString.Key.foregroundColor: normalColor as Any
      ]
    }
    
    let tabBarAppearance = UITabBarAppearance()
    tabBarAppearance.configureWithOpaqueBackground()
    tabBarAppearance.backgroundColor = .white
    UITabBar.appearance().standardAppearance = tabBarAppearance
    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    
    updateItemAppearance(for: tabBarAppearance.compactInlineLayoutAppearance)
    updateItemAppearance(for: tabBarAppearance.inlineLayoutAppearance)
    updateItemAppearance(for: tabBarAppearance.stackedLayoutAppearance)
  }
  
  func customiseNavigationBar() {
    UINavigationBar.appearance().isTranslucent = false
    UINavigationBar.appearance().standardAppearance = .defaultStandard()
    UINavigationBar.appearance().scrollEdgeAppearance = .defaultStandard()
  }
  
  func customiseOther() {
    UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = Colors.General.lightPurple.color
    UIBarButtonItem.appearance().tintColor = .black
    
    UISegmentedControl.appearance().setTitleTextAttributes([
      NSAttributedString.Key.foregroundColor: UIColor.black as Any,
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .medium) as Any
    ], for: .normal)
    UISegmentedControl.appearance().setTitleTextAttributes([
      NSAttributedString.Key.foregroundColor: UIColor.white as Any,
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .medium) as Any
    ], for: .selected)
  }
}
