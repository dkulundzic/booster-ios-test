//
//  BoostsViewController.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Martian & Machine. All rights reserved.
//

import UIKit

protocol BoostsDisplayLogic: AnyObject { }

class BoostsViewController: UIContentViewController<BoostsContentView> {
  var presenter: BoostsViewPresentingLogic?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

// MARK: - BoostsDisplayLogic
extension BoostsViewController: BoostsDisplayLogic { }

private extension BoostsViewController {
  func setupView() { }
}
