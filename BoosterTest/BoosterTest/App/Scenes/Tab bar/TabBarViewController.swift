//
//  TabBarViewController.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import Localization

protocol TabBarDisplayLogic: AnyObject { }

class TabBarViewController: UITabBarController {
  var presenter: TabBarViewPresentingLogic?
  private let mapScene = MapRouter.createModule(delegate: nil)
  private let boostsScene = BoostsRouter.createModule(delegate: nil)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewControllers()
  }
}

// MARK: - TabBarDisplayLogic
extension TabBarViewController: TabBarDisplayLogic { }

private extension TabBarViewController {
  func setupViewControllers() {
    mapScene.tabBarItem.title = Localization.Map.title.localized()
    mapScene.tabBarItem.image = Icons.map.image
    boostsScene.tabBarItem.title = Localization.Boosts.title.localized()
    boostsScene.tabBarItem.image = Icons.boost.image
    
    viewControllers = [
      UINavigationController(rootViewController: mapScene),
      UINavigationController(rootViewController: boostsScene)
    ]
  }
}
