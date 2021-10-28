//
//  MapPresenter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Martian & Machine. All rights reserved.
//

import Foundation

protocol MapViewPresentingLogic: AnyObject { }

class MapPresenter {
  var interactor: MapBusinessLogic?
  weak private var view: MapDisplayLogic?
  private let router: MapRoutingLogic
  
  init(interface: MapDisplayLogic, interactor: MapBusinessLogic?, router: MapRoutingLogic) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - MapViewPresentingLogic
extension MapPresenter: MapViewPresentingLogic { }
