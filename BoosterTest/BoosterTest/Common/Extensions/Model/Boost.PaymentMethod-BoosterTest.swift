//
//  Boost.PaymentMethod-BoosterTest.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import UIKit
import Model

extension Boost.PaymentMethod {
  var icon: UIImage {
    switch self {
    case .cash:
      return Icons.cash.image
    case .creditCard:
      return Icons.creditCard.image
    }
  }
}
