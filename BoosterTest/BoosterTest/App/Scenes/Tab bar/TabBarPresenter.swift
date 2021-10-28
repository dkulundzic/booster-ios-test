//
//  TabBarPresenter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation

protocol TabBarViewPresentingLogic: AnyObject { }

class TabBarPresenter {
  var interactor: TabBarBusinessLogic?
  weak private var view: TabBarDisplayLogic?
  private let router: TabBarRoutingLogic
  
  init(interface: TabBarDisplayLogic, interactor: TabBarBusinessLogic?, router: TabBarRoutingLogic) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - TabBarViewPresentingLogic
extension TabBarPresenter: TabBarViewPresentingLogic { }
