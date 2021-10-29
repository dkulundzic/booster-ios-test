//
//  BoostService.swift
//  Networking
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import CoreLocation
#warning("NOTE: Used for practical purposes, while respecting API boundaries.")
@testable import Model

public protocol BoostServiceProtocol {
  func orderBoost(
    at boostLocation: CLLocationCoordinate2D,
    on date: Date,
    using deliveryWindow: Boost.DeliveryWindow,
    paymentMethod: Boost.PaymentMethod
  ) async
}

public final class BoostService {
  private let boostsStore: BoostsStoreProtocol
  
  public init(boostsStore: BoostsStoreProtocol = BoostsStore()) {
    self.boostsStore = boostsStore
  }
}

extension BoostService: BoostServiceProtocol {
  public func orderBoost(
    at boostLocation: CLLocationCoordinate2D,
    on date: Date,
    using deliveryWindow: Boost.DeliveryWindow,
    paymentMethod: Boost.PaymentMethod
  ) async {
    await Task.sleep(1 * 1000000000)
    boostsStore.add(
      boost: Boost(date: date, deliveryWindow: deliveryWindow, paymentMethod: paymentMethod)
    )
  }
}
