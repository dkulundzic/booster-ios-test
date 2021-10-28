//
//  BoostDetailsRouter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Martian & Machine. All rights reserved.
//

import UIKit

protocol BoostDetailsRoutingLogic: AnyObject { }

protocol BoostDetailsRouterDelegate: AnyObject { }

class BoostDetailsRouter {
  weak var viewController: BoostDetailsViewController?
  weak var delegate: BoostDetailsRouterDelegate?
  
  static func createModule(delegate: BoostDetailsRouterDelegate?) -> BoostDetailsViewController {
    let view = BoostDetailsViewController(nibName: nil, bundle: nil)
    let interactor = BoostDetailsInteractor()
    let router = BoostDetailsRouter()
    router.delegate = delegate
    router.viewController = view
    let presenter = BoostDetailsPresenter(interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}

// MARK: - BoostDetailsRoutingLogic
extension BoostDetailsRouter: BoostDetailsRoutingLogic { }
