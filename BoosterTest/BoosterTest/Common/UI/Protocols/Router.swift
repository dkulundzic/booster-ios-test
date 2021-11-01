//
//  Router.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 31.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import UIKit
import System
import Localization

public protocol Router {
  associatedtype ViewController: UIViewController
  var viewController: ViewController? { get }
}

extension Router {
  func showErrorAlert(
    title: String? = Localization.Alerts.errorTitle.localized(),
    message: String?,
    action: Action? = nil
  ) {
    let alertController = UIAlertController.error(title: title, message: message, action: action)
    viewController?.present(alertController, animated: true, completion: nil)
  }
}
