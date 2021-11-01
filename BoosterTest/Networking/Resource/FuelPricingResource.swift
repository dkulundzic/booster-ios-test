//
//  FuelPricingResource.swift
//  Networking
//
//  Created by Domagoj Kulundzic on 01.11.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation

enum FuelPricingResource: Resource {
  case fuelPricing

  var endpoint: String {
    switch self {
    case .fuelPricing:
      return "fuel-pricing"
    }
  }
}
