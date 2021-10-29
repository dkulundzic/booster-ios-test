//
//  FuelInformationService.swift
//  Networking
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
#warning("NOTE: Used for practical purposes, while respecting API boundaries.")
@testable import Model

public protocol FuelInformationServiceProtocol {
  func loadFuelInformation() async -> FuelPricingInformation
}

public final class FuelInformationService {
  public init() { }
}

extension FuelInformationService: FuelInformationServiceProtocol {
  public func loadFuelInformation() async -> FuelPricingInformation {
    await Task.sleep(1 * 1000000000)
    return FuelPricingInformation(
      regularPrice: Float.random(min: 2.5, max: 3.5),
      premiumPrice: Float.random(min: 3.5, max: 6.5)
    )
  }
}

private extension Float {
  static var random: Float {
    Float(arc4random()) / 0xFFFFFFFF
  }
  
  static func random(min: Float, max: Float) -> Float {
    Float.random * (max - min) + min
  }
}
