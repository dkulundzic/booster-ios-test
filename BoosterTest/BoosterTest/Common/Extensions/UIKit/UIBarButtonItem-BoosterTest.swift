//
//  UIBarButtonItem-BoosterTest.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 31.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import System
import Localization

extension UIBarButtonItem {
  static func cancel(target: AnyObject, action: Selector) -> UIBarButtonItem {
    UIBarButtonItem(title: Localization.Actions.cancel.localized(), style: .done, target: target, action: action)
  }
}
