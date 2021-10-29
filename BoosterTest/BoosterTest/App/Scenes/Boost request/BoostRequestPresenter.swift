//
//  BoostRequestPresenter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import CoreLocation

protocol BoostRequestViewPresentingLogic: AnyObject { }

class BoostRequestPresenter {
  var interactor: BoostRequestBusinessLogic?
  weak private var view: BoostRequestDisplayLogic?
  private let router: BoostRequestRoutingLogic
  private let boostLocation: CLLocationCoordinate2D
  
  init(
    boostLocation: CLLocationCoordinate2D,
    interface: BoostRequestDisplayLogic,
    interactor: BoostRequestBusinessLogic?,
    router: BoostRequestRoutingLogic
  ) {
    self.boostLocation = boostLocation
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - BoostRequestViewPresentingLogic
extension BoostRequestPresenter: BoostRequestViewPresentingLogic { }
