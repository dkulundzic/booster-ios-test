//
//  Boost.swift
//  Model
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation

public struct Boost {
  public enum DeliveryWindow: CustomStringConvertible, CaseIterable {
    case morning
    case afternoon
    
    #warning("TODO: Localise")
    public var description: String {
      switch self {
      case .morning:
        return "Morning"
      case .afternoon:
        return "Afternoon"
      }
    }
  }
  
  public enum PaymentMethod: CaseIterable {
    case cash
    case creditCard
  }
  
  public let deliveryWindow: DeliveryWindow
  public let paymentMethod: PaymentMethod
  
  public init(
    deliveryWindow: Boost.DeliveryWindow,
    paymentMethod: Boost.PaymentMethod
  ) {
    self.deliveryWindow = deliveryWindow
    self.paymentMethod = paymentMethod
  }
}
