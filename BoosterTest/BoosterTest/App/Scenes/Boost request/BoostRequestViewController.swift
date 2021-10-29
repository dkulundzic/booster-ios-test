//
//  BoostRequestViewController.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

protocol BoostRequestDisplayLogic: AnyObject {
  func displayActionButton(enabled: Bool)
}

class BoostRequestViewController: ContentViewController<BoostRequestContentView> {
  override var isNavigationBarHidden: Bool? { false }
  var presenter: BoostRequestViewPresentingLogic?
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupNavigationBar()
    presenter?.onViewLoaded()
  }
}

// MARK: - BoostRequestDisplayLogic
extension BoostRequestViewController: BoostRequestDisplayLogic {
  func displayActionButton(enabled: Bool) {
    contentView.isActionButtonEnabled = enabled
  }
}

private extension BoostRequestViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() {
    contentView.deliveryWindowSelectionHandler = { [weak self] segmentIndex in
      self?.presenter?.onDeliveryWindowSegmentSelected(at: segmentIndex)
    }
    contentView.paymentMethodSelectionHandler = { [weak self] segmentIndex in
      self?.presenter?.onPaymentMethodSegmentSelected(at: segmentIndex)
    }
    contentView.actionTapHandler = { [weak self] in
      self?.presenter?.onActionButtonTapped()
    }
    contentView.dateSelectionHandler = { [weak self] selectedDate in
      self?.presenter?.onDateSelected(selectedDate)
    }
  }
  
  func setupNavigationBar() {
    #warning("TODO: Localise")
    navigationItem.title = "Create a Boost"
  }
}
