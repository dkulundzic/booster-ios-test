//
//  BoostRequestViewController.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

protocol BoostRequestDisplayLogic: AnyObject { }

class BoostRequestViewController: ContentViewController<BoostRequestContentView> {
  override var isNavigationBarHidden: Bool? { false }
  var presenter: BoostRequestViewPresentingLogic?
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupNavigationBar()
  }
}

// MARK: - BoostRequestDisplayLogic
extension BoostRequestViewController: BoostRequestDisplayLogic { }

private extension BoostRequestViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() { }
  
  func setupNavigationBar() {
    #warning("TODO: Localise")
    navigationItem.title = "Create a Boost"
  }
}
