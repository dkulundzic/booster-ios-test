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
import Model

protocol MapViewPresentingLogic: AnyObject {
  func onViewLoaded()
  func onViewWillAppear()
  func onMapFirstTimeRendering()
  func onUserSelectedBoostLocation(_ location: CLLocationCoordinate2D)
  func onHomeButtonTapped()
  func onCenterButtonTapped()
  func onActionButtonTapped()
  func onBoostOrdered(_ boost: Boost)
}

class MapPresenter {
  var interactor: MapBusinessLogic
  weak private var view: MapDisplayLogic?
  private let router: MapRoutingLogic
  private let boostLocationSubject = CurrentValueSubject<CLLocationCoordinate2D?, Never>(nil)
  private var bag = Set<AnyCancellable>()
  private lazy var currencyFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencySymbol = "$"
    formatter.maximumFractionDigits = 2
    return formatter
  }()
  
  init(
    interface: MapDisplayLogic,
    interactor: MapBusinessLogic,
    router: MapRoutingLogic
  ) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - MapViewPresentingLogic
extension MapPresenter: MapViewPresentingLogic {
  func onViewLoaded() {
    setupObserving()
  }
  
  func onViewWillAppear() {
    loadAndPresentFuelPricingInformation()
  }
  
  func onMapFirstTimeRendering() {
    view?.displayInfoView(shown: true)
    view?.displaySelectionPin(shown: true)
  }
  
  func onUserSelectedBoostLocation(_ location: CLLocationCoordinate2D) {
    boostLocationSubject.value = location
  }
  
  func onHomeButtonTapped() {
    // Not implemented, expected functionality unknown.
  }
  
  func onCenterButtonTapped() {
    if let userLocation = interactor.userLocation {
      view?.displayMapCenteringOnUser(using: userLocation)
    }
  }
  
  func onActionButtonTapped() {
    guard let boostLocation = boostLocationSubject.value else { return }
    router.showBoostRequestScene(using: boostLocation)
  }
  
  func onBoostOrdered(_ boost: Boost) {
    router.showBoostDetails(for: boost)
  }
}

private extension MapPresenter {
  func setupObserving() {
    boostLocationSubject
      .sink { [weak self] boostLocation in
        self?.view?.displayActionButton(enabled: boostLocation != nil)
      }
      .store(in: &bag)
    
    interactor.userLocationPublisher
      .sink { [weak self] location in
        self?.view?.displayCenteringButton(enabled: location != nil)
      }
      .store(in: &bag)
  }
  
  func loadAndPresentFuelPricingInformation() {
    Task {
      await MainActor.run {
        self.view?.displayFuelInformationLoading(inProgress: true)
      }
      
      let pricingInformation = try await interactor.loadFuelPricingInformation()
      let formattedRegularPrice = currencyFormatter.string(from: NSNumber(value: pricingInformation.regularPrice))
      let formattedPremiumPrice = currencyFormatter.string(from: NSNumber(value: pricingInformation.premiumPrice))
      
      await MainActor.run {
        self.view?.displayFuelInformationLoading(inProgress: false)
        self.view?.displayFuelInformation(
          regularPricing: MapFuelPricingView.ViewModel(title: "Regular 87", formattedPrice: formattedRegularPrice),
          premiumPricing: MapFuelPricingView.ViewModel(title: "Premium 91", formattedPrice: formattedPremiumPrice)
        )
      }
    }
  }
}
