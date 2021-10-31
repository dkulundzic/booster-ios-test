//
//  BoostDetailsRouter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import Model

protocol BoostDetailsRoutingLogic: AnyObject {
  func showCancellationConfirmationAlert(for boost: Boost)
  func notifyBoostCancellation(_ boost: Boost)
}

protocol BoostDetailsRouterDelegate: AnyObject {
  func boostDetailsRouterCancelledBoost(_ boost: Boost)
}

class BoostDetailsRouter {
  weak var viewController: BoostDetailsViewController?
  weak var delegate: BoostDetailsRouterDelegate?
  
  static func createModule(
    boost: Boost,
    delegate: BoostDetailsRouterDelegate?
  ) -> BoostDetailsViewController {
    let view = BoostDetailsViewController(nibName: nil, bundle: nil)
    let interactor = BoostDetailsInteractor()
    let router = BoostDetailsRouter()
    router.delegate = delegate
    router.viewController = view
    let presenter = BoostDetailsPresenter(boost: boost, interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}

// MARK: - BoostDetailsRoutingLogic
extension BoostDetailsRouter: BoostDetailsRoutingLogic {
  func showCancellationConfirmationAlert(for boost: Boost) {
    viewController?.present(UIAlertController.boostCancellationConfirmation { [weak self] in
      self?.viewController?.presenter?.onBoostCancellationConfirmed()
    }, animated: true, completion: nil)
  }
  
  func notifyBoostCancellation(_ boost: Boost) {
    delegate?.boostDetailsRouterCancelledBoost(boost)
  }
}
