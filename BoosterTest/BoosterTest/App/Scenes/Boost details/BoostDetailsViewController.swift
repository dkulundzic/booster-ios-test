//
//  BoostDetailsViewController.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Martian & Machine. All rights reserved.
//

import UIKit

protocol BoostDetailsDisplayLogic: AnyObject { }

class BoostDetailsViewController: UIContentViewController<BoostDetailsContentView> {
  var presenter: BoostDetailsViewPresentingLogic?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

// MARK: - BoostDetailsDisplayLogic
extension BoostDetailsViewController: BoostDetailsDisplayLogic { }

private extension BoostDetailsViewController {
  func setupView() { }
}
