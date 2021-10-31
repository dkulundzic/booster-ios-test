//
//  UIAlertAction-BoosterTest.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import System
import Localization

extension UIAlertAction {
  static func acknowledgement(action: Action? = nil) -> UIAlertAction {
    UIAlertAction(title: Localization.Actions.acknowledgement.localized().uppercased(), style: .cancel, handler: { _ in action?() })
  }
  
  static func cancel(action: Action? = nil) -> UIAlertAction {
    UIAlertAction(title: Localization.Actions.cancel.localized(), style: .cancel, handler: { _ in action?() })
  }
  
  static func confirmation(style: UIAlertAction.Style = .default, action: Action? = nil) -> UIAlertAction {
    UIAlertAction(title: Localization.Actions.confirmation.localized(), style: style, handler: { _ in action?() })
  }
  
  static func negation(action: Action? = nil) -> UIAlertAction {
    UIAlertAction(title: Localization.Actions.negation.localized(), style: .cancel, handler: { _ in action?() })
  }
}
