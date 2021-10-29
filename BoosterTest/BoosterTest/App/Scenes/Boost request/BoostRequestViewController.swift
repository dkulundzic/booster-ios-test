//
//  BoostRequestViewController.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

protocol BoostRequestDisplayLogic: AnyObject { }

class BoostRequestViewController: UIViewController {
  var presenter: BoostRequestViewPresentingLogic?
  private lazy var contentView = BoostRequestContentView()

  override func loadView() {
    view = contentView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

// MARK: - BoostRequestDisplayLogic
extension BoostRequestViewController: BoostRequestDisplayLogic { }

private extension BoostRequestViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
  }
}
