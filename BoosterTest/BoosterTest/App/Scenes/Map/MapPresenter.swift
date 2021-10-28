//
//  MapPresenter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import CoreLocation
import Combine

protocol MapViewPresentingLogic: AnyObject {
  func onViewLoaded()
  func onMapFirstTimeRendering()
  func onMapUpdatedUserLocation(_ location: CLLocationCoordinate2D)
  func onHomeButtonTapped()
  func onCenterButtonTapped()
}

class MapPresenter {
  var interactor: MapBusinessLogic?
  weak private var view: MapDisplayLogic?
  private let router: MapRoutingLogic
  private var userLocationSubject = CurrentValueSubject<CLLocationCoordinate2D?, Never>(nil)
  private var bag = Set<AnyCancellable>()
  
  init(interface: MapDisplayLogic, interactor: MapBusinessLogic?, router: MapRoutingLogic) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - MapViewPresentingLogic
extension MapPresenter: MapViewPresentingLogic {
  func onViewLoaded() {
    setupObserving()
    interactor?.requestLocationAuthorization()
  }
  
  func onMapFirstTimeRendering() {
    view?.displayInfoView(shown: true)
    view?.displaySelectionPin(shown: true)
  }
  
  func onMapUpdatedUserLocation(_ location: CLLocationCoordinate2D) {
    userLocationSubject.value = location
  }
  
  func onHomeButtonTapped() {
#warning("TODO:")
    print(#function)
  }
  
  func onCenterButtonTapped() {
    if let userLocation = userLocationSubject.value {
      view?.displayMapCenteringOnUser(using: userLocation)
    }
  }
}

private extension MapPresenter {
  func setupObserving() {
    userLocationSubject
      .sink { [weak self] location in
        self?.view?.displayCenteringButton(enabled: location != nil)
      }
      .store(in: &bag)
  }
}
