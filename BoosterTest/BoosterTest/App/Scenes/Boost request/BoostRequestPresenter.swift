//
//  BoostRequestPresenter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import CoreLocation
import Combine
import Model

protocol BoostRequestViewPresentingLogic: AnyObject {
  func onViewLoaded()
  func onDeliveryWindowSegmentSelected(at index: Int)
  func onPaymentMethodSegmentSelected(at index: Int)
  func onActionButtonTapped()
}

class BoostRequestPresenter {
  var interactor: BoostRequestBusinessLogic
  weak private var view: BoostRequestDisplayLogic?
  private let router: BoostRequestRoutingLogic
  private let boostLocation: CLLocationCoordinate2D
  private let deliveryWindowSubject = CurrentValueSubject<Boost.DeliveryWindow?, Never>(nil)
  private let paymentMethodSubject = CurrentValueSubject<Boost.PaymentMethod?, Never>(nil)
  private var bag = Set<AnyCancellable>()
  
  init(
    boostLocation: CLLocationCoordinate2D,
    interface: BoostRequestDisplayLogic,
    interactor: BoostRequestBusinessLogic,
    router: BoostRequestRoutingLogic
  ) {
    self.boostLocation = boostLocation
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - BoostRequestViewPresentingLogic
extension BoostRequestPresenter: BoostRequestViewPresentingLogic {
  func onViewLoaded() {
    setupObserving()
  }
  
  func onDeliveryWindowSegmentSelected(at index: Int) {
    deliveryWindowSubject.value = Boost.DeliveryWindow.allCases[safe: index]
  }
  
  func onPaymentMethodSegmentSelected(at index: Int) {
    paymentMethodSubject.value = Boost.PaymentMethod.allCases[safe: index]
  }
  
  func onActionButtonTapped() {
    guard
      let deliveryWindow = deliveryWindowSubject.value,
      let paymentMethod = paymentMethodSubject.value else {
        return
      }
    Task {
      await MainActor.run { self.view?.displayActionButton(enabled: false) }
      await interactor.orderBoost(at: boostLocation, using: deliveryWindow, paymentMethod: paymentMethod)
      await MainActor.run { self.router.showBoostOrderedAlert() }
    }
  }
}

private extension BoostRequestPresenter {
  func setupObserving() {
    deliveryWindowSubject
      .combineLatest(paymentMethodSubject)
      .sink { [weak self] deliveryWindow, paymentMethodSubject in
        let isOrderingEnabled = deliveryWindow != nil && paymentMethodSubject != nil
        self?.view?.displayActionButton(enabled: isOrderingEnabled)
      }
      .store(in: &bag)
  }
}
