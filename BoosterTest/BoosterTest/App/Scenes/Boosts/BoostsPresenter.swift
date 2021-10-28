//
//  BoostsPresenter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Martian & Machine. All rights reserved.
//

import Foundation

protocol BoostsViewPresentingLogic: AnyObject { }

class BoostsPresenter {
  var interactor: BoostsBusinessLogic?
  weak private var view: BoostsDisplayLogic?
  private let router: BoostsRoutingLogic
  
  init(interface: BoostsDisplayLogic, interactor: BoostsBusinessLogic?, router: BoostsRoutingLogic) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - BoostsViewPresentingLogic
extension BoostsPresenter: BoostsViewPresentingLogic { }
