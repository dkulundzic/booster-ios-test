//
//  UIAlertController-BoosterTest.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import System
import Localization

extension UIAlertController {
  static func boostOrdered(action: Action?) -> UIAlertController {
    let alertController = UIAlertController(
      title: Localization.Alerts.boostOrderedTitle.localized(),
      message: Localization.Alerts.boostOrderedMessage.localized(),
      preferredStyle: .alert
    )
    alertController.addAction(.confirmation(action: action))
    return alertController
  }
}
