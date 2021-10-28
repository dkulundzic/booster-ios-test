//
//  TabBarViewController.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Martian & Machine. All rights reserved.
//

import UIKit

protocol TabBarDisplayLogic: AnyObject { }

class TabBarViewController: UIContentViewController<TabBarContentView> {
  var presenter: TabBarViewPresentingLogic?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

// MARK: - TabBarDisplayLogic
extension TabBarViewController: TabBarDisplayLogic { }

private extension TabBarViewController {
  func setupView() { }
}
