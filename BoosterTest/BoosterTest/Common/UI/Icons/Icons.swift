//
//  Icons.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import UIKit

public enum Icons: String {
  case car = "car.fill"
  case creditCard = "creditcard.circle"
  case boost = "fuelpump.circle"
  case house
  case map
  case scope
  case timer
}

public extension Icons {
  var image: UIImage {
    guard let image = UIImage(systemName: rawValue) else {
      fatalError("Missing SF Symbol: \(rawValue)")
    }
    return image
  }
}
