//
//  TabBarRouter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Martian & Machine. All rights reserved.
//

import UIKit

protocol TabBarRoutingLogic: AnyObject { }

protocol TabBarRouterDelegate: AnyObject { }

class TabBarRouter {
  weak var viewController: TabBarViewController?
  weak var delegate: TabBarRouterDelegate?
  
  static func createModule(delegate: TabBarRouterDelegate?) -> TabBarViewController {
    let view = TabBarViewController(nibName: nil, bundle: nil)
    let interactor = TabBarInteractor()
    let router = TabBarRouter()
    router.delegate = delegate
    router.viewController = view
    let presenter = TabBarPresenter(interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}

// MARK: - TabBarRoutingLogic
extension TabBarRouter: TabBarRoutingLogic { }
