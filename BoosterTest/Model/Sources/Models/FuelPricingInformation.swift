//
//  FuelPricingInformation.swift
//  Model
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation

public struct FuelPricingInformation {
  public let regularPrice: Float
  public let premiumPrice: Float
}

extension FuelPricingInformation: Decodable { }
