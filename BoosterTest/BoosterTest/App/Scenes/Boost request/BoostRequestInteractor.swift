//
//  BoostRequestInteractor.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import CoreLocation
import Networking
import Model

protocol BoostRequestBusinessLogic: AnyObject {
  func orderBoost(
    at boostLocation: CLLocationCoordinate2D,
    on date: Date,
    using deliveryMethod: Boost.DeliveryWindow,
    paymentMethod: Boost.PaymentMethod
  ) async
}

class BoostRequestInteractor {
  private let boostService: BoostServiceProtocol
  
  init(boostService: BoostServiceProtocol = BoostService()) {
    self.boostService = boostService
  }
}

// MARK: - BoostRequestBusinessLogic
extension BoostRequestInteractor: BoostRequestBusinessLogic {
  func orderBoost(
    at boostLocation: CLLocationCoordinate2D,
    on date: Date,
    using deliveryMethod: Boost.DeliveryWindow,
    paymentMethod: Boost.PaymentMethod
  ) async {
    await boostService.orderBoost(at: boostLocation, on: date, using: deliveryMethod, paymentMethod: paymentMethod)
  }
}
