//
//  BoostDetailsPresenter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import Model
import System

protocol BoostDetailsViewPresentingLogic: AnyObject {
  func onViewLoaded()
  func onCancelBarButtonTapped()
  func onBoostCancellationConfirmed()
}

class BoostDetailsPresenter {
  var interactor: BoostDetailsBusinessLogic
  weak private var view: BoostDetailsDisplayLogic?
  private let router: BoostDetailsRoutingLogic
  private let boost: Boost
  private let dateFormatter = System.DateFormatter()
  
  init(
    boost: Boost,
    interface: BoostDetailsDisplayLogic,
    interactor: BoostDetailsBusinessLogic,
    router: BoostDetailsRoutingLogic
  ) {
    self.boost = boost
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - BoostDetailsViewPresentingLogic
extension BoostDetailsPresenter: BoostDetailsViewPresentingLogic {
  func onViewLoaded() {
    let details = BoostDetailsContentView.ViewModel(
      formattedDate: dateFormatter.format(date: boost.date),
      deliveryWindow: boost.deliveryWindow.description,
      paymentMethod: boost.paymentMethod.description
    )
    view?.displayBoostDetails(details)
  }
  
  func onCancelBarButtonTapped() {
    router.showCancellationConfirmationAlert(for: boost)
  }
  
  func onBoostCancellationConfirmed() {
    Task {
      await interactor.cancelBoost(boost)
      await MainActor.run { self.router.notifyBoostCancellation(self.boost) }
    }
  }
}
