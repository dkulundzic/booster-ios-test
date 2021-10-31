//
//  BoostDetailsViewController.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import Localization

protocol BoostDetailsDisplayLogic: AnyObject { }

class BoostDetailsViewController: ContentViewController<BoostDetailsContentView> {
  override var isNavigationBarHidden: Bool? { false }
  var presenter: BoostDetailsViewPresentingLogic?
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupNavigationBar()
    presenter?.onViewLoaded()
  }
}

// MARK: - BoostDetailsDisplayLogic
extension BoostDetailsViewController: BoostDetailsDisplayLogic { }

private extension BoostDetailsViewController {
  @objc func cancelBarButtonTapped() {
    presenter?.onCancelBarButtonTapped()
  }
}

private extension BoostDetailsViewController {
  func setupView() { }
  
  func setupNavigationBar() {
    navigationItem.title = Localization.BoostDetails.title.localized()
    navigationItem.rightBarButtonItem = .cancel(target: self, action: #selector(cancelBarButtonTapped))
  }
}
