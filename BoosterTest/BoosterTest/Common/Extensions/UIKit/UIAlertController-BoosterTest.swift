//
//  UIAlertController-BoosterTest.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import System

extension UIAlertController {
  static func boostOrdered(action: Action?) -> UIAlertController {
    #warning("TODO: Localise")
    let alertController = UIAlertController(
      title: "Boost ordered",
      message: "Congratulations, you have successfully ordered a boost! ",
      preferredStyle: .alert
    )
    alertController.addAction(.confirmation(action: action))
    return alertController
  }
}
