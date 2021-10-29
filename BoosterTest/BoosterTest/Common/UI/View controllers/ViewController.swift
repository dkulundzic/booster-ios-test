//
//  ViewController.swift
//
//  Created by Domagoj Kulundzic on 27.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import UIKit

open class ViewController: UIViewController {
  open var isNavigationBarHidden: Bool? { return nil }

  open override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if let isNavigationBarHidden = isNavigationBarHidden {
      navigationController?.setNavigationBarHidden(isNavigationBarHidden, animated: animated)
    }
  }
}
