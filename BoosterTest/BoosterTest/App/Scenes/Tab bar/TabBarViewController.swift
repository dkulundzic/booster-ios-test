//
//  TabBarViewController.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

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
#warning("TODO: Localise")
    mapScene.tabBarItem.title = "Map"
    mapScene.tabBarItem.image = Icons.map.image
#warning("TODO: Localise")
    boostsScene.tabBarItem.title = "Boosts"
    boostsScene.tabBarItem.image = Icons.boost.image
    
    viewControllers = [mapScene, UINavigationController(rootViewController: boostsScene)]
  }
}
