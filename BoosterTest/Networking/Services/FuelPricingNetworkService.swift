//
//  FuelPricingNetworkService.swift
//  Networking
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import Model

public protocol FuelPricingNetworkServiceProtocol {
  func fetchFuelPricing() async throws -> FuelPricing
}

public final class FuelPricingNetworkService {
  public init() { }
}

extension FuelPricingNetworkService: FuelPricingNetworkServiceProtocol {
  public func fetchFuelPricing() async throws -> FuelPricing {
    let (data, _) = try await URLSession.shared.data(from: FuelPricingResource.fuelPricing.url)
    return try JSONDecoder().decode(FuelPricing.self, from: data)
  }
}
