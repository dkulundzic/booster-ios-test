//
//  BoostRequestRouter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import CoreLocation
import Model

protocol BoostRequestRoutingLogic: AnyObject {
  func showBoostOrderedAlert(for boost: Boost)
  func showErrorAlert(using message: String?)
  func dismiss()
}

protocol BoostRequestRouterDelegate: AnyObject {
  func boostRequestDelegateOrderedBoost(_ boost: Boost)
  func boostRequestDelegateRequestedDismissal()
}

class BoostRequestRouter: Router {
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
  func showBoostOrderedAlert(for boost: Boost) {
    viewController?.present(UIAlertController.boostOrdered { [weak self] in
      self?.delegate?.boostRequestDelegateOrderedBoost(boost)
    }, animated: true, completion: nil)
  }
  
  func showErrorAlert(using message: String?) {
    showErrorAlert(message: message)
  }
  
  func dismiss() {
    delegate?.boostRequestDelegateRequestedDismissal()
  }
}
