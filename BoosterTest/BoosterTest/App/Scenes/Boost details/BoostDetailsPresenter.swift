//
//  BoostDetailsPresenter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation

protocol BoostDetailsViewPresentingLogic: AnyObject { }

class BoostDetailsPresenter {
  var interactor: BoostDetailsBusinessLogic?
  weak private var view: BoostDetailsDisplayLogic?
  private let router: BoostDetailsRoutingLogic
  
  init(interface: BoostDetailsDisplayLogic, interactor: BoostDetailsBusinessLogic?, router: BoostDetailsRoutingLogic) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - BoostDetailsViewPresentingLogic
extension BoostDetailsPresenter: BoostDetailsViewPresentingLogic { }
