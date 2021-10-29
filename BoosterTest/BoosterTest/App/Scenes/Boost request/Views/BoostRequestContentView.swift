//
//  BoostRequestContentView.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import Model

class BoostRequestContentView: UIView {
  private lazy var stackView = UIStackView()
  private lazy var deliveryWindowSectionView = SectionView()
  private lazy var deliveryWindowSegmentedControl = UISegmentedControl(items: Boost.DeliveryWindow.allCases.map(\.description))
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Actions
private extension BoostRequestContentView {
  @objc func deliveryWindowSegmentedControlChangedSelectedSegment(_ sender: UISegmentedControl) {
    print(#function, sender.selectedSegmentIndex)
  }
}

// MARK: - Private Methods
private extension BoostRequestContentView {
  func setupViews() {
    setupView()
    setupStackView()
    setupDeliveryWindowSectionView()
    setupDeliveryWindowSegmentedControl()
  }
  
  func setupView() {
    backgroundColor = .white
  }
  
  func setupStackView() {
    addSubview(stackView)
    stackView.snp.makeConstraints {
      $0.leading.trailing.top.equalToSuperview().inset(16)
      $0.bottom.lessThanOrEqualToSuperview().inset(16)
    }
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = 24
  }
  
  func setupDeliveryWindowSectionView() {
    stackView.addArrangedSubview(deliveryWindowSectionView)
#warning("TODO: Localise")
    deliveryWindowSectionView.title = "Delivery window"
#warning("TODO: Localise")
    deliveryWindowSectionView.subtitle = "Please select the delivery window for you Boost."
  }
  
  func setupDeliveryWindowSegmentedControl() {
    deliveryWindowSectionView.embedView(deliveryWindowSegmentedControl)
    deliveryWindowSegmentedControl.selectedSegmentTintColor = Colors.General.purple.color
    deliveryWindowSegmentedControl.apportionsSegmentWidthsByContent = true
    deliveryWindowSegmentedControl.addTarget(self, action: #selector(deliveryWindowSegmentedControlChangedSelectedSegment(_:)), for: .valueChanged)
    
  }
}
