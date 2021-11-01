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
    alertController.addAction(.acknowledgement(action: action))
    return alertController.validate()
  }
  
  static func boostCancellationConfirmation(action: Action?) -> UIAlertController {
    let alertController = UIAlertController(
      title: Localization.Alerts.boostCancellationTitle.localized(),
      message: Localization.Alerts.boostCancellationMessage.localized(),
      preferredStyle: .alert
    )
    alertController.addAction(.negation())
    alertController.addAction(.confirmation(style: .destructive, action: action))
    return alertController.validate()
  }
  
  static func error(title: String?, message: String?, action: Action? = nil) -> UIAlertController {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(.acknowledgement(action: action))
    return alertController.validate()
  }
}

private extension UIAlertController {
  func validate() -> UIAlertController {
    if !actions.contains(where: { $0.style == .cancel }) {
      addAction(.cancel())
    }
    return self
  }
}
