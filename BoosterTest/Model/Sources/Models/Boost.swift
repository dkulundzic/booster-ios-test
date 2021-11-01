//
//  Boost.swift
//  Model
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import Localization

public struct Boost {
  public enum DeliveryWindow: String, CustomStringConvertible, CaseIterable {
    case morning
    case afternoon
    
    public var description: String {
      switch self {
      case .morning:
        return Localization.General.morning.localized()
      case .afternoon:
        return Localization.General.afternoon.localized()
      }
    }
  }
  
  public enum PaymentMethod: String, CaseIterable {
    case cash
    case creditCard = "credit_card"
    
    public var description: String {
      switch self {
      case .cash:
        return Localization.General.cash.localized()
      case .creditCard:
        return Localization.General.creditCard.localized()
      }
    }
  }
  
  public let id = UUID().uuidString
  public let date: Date
  public let deliveryWindow: DeliveryWindow
  public let paymentMethod: PaymentMethod
  
  public init(
    date: Date,
    deliveryWindow: Boost.DeliveryWindow,
    paymentMethod: Boost.PaymentMethod
  ) {
    self.date = date
    self.deliveryWindow = deliveryWindow
    self.paymentMethod = paymentMethod
  }
}

extension Boost: Equatable {
  public static func == (lhs: Boost, rhs: Boost) -> Bool {
    lhs.id == rhs.id
  }
}
