//
//  BoostsRouter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

protocol BoostsRoutingLogic: AnyObject { }

protocol BoostsRouterDelegate: AnyObject { }

class BoostsRouter {
  weak var viewController: BoostsViewController?
  weak var delegate: BoostsRouterDelegate?
  
  static func createModule(delegate: BoostsRouterDelegate?) -> BoostsViewController {
    let view = BoostsViewController(nibName: nil, bundle: nil)
    let interactor = BoostsInteractor()
    let router = BoostsRouter()
    router.delegate = delegate
    router.viewController = view
    let presenter = BoostsPresenter(interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}

// MARK: - BoostsRoutingLogic
extension BoostsRouter: BoostsRoutingLogic { }
