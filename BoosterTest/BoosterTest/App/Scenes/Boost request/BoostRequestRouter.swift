//
//  BoostRequestRouter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import CoreLocation

protocol BoostRequestRoutingLogic: AnyObject {
  func showBoostOrderedAlert()
  func dismiss()
}

protocol BoostRequestRouterDelegate: AnyObject {
  func boostRequestDelegateRequestedDismissal()
}

class BoostRequestRouter {
  weak var viewController: BoostRequestViewController?
  weak var delegate: BoostRequestRouterDelegate?
  
  static func createModule(boostLocation: CLLocationCoordinate2D, delegate: BoostRequestRouterDelegate?) -> BoostRequestViewController {
    let view = BoostRequestViewController(nibName: nil, bundle: nil)
    let interactor = BoostRequestInteractor()
    let router = BoostRequestRouter()
    router.delegate = delegate
    router.viewController = view
    let presenter = BoostRequestPresenter(boostLocation: boostLocation, interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}

// MARK: - BoostRequestRoutingLogic
extension BoostRequestRouter: BoostRequestRoutingLogic {
  func showBoostOrderedAlert() {
    viewController?.present(UIAlertController.boostOrdered { [weak self] in
      self?.dismiss()
    }, animated: true, completion: nil)
  }
  
  func dismiss() {
    delegate?.boostRequestDelegateRequestedDismissal()
  }
}
