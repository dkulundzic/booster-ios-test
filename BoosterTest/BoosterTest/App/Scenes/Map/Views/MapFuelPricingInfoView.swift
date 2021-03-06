//
//  MapFuelPricingInfoView.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

class MapFuelPricingInfoView: UIView {
  private(set) lazy var regularPriceView = MapFuelPricingView()
  private(set) lazy var premiumPriceView = MapFuelPricingView()
  private lazy var stackView = UIStackView()
  private lazy var separatorView = VerticalSeparatorView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
private extension MapFuelPricingInfoView {
  func setupViews() {
    setupStackView()
    setupRegularPriceView()
    setupPremiumPriceView()
    setupSeparatorView()
  }
  
  func setupStackView() {
    addSubview(stackView)
    stackView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.alignment = .fill
  }
  
  func setupRegularPriceView() {
    stackView.addArrangedSubview(regularPriceView)
  }
  
  func setupPremiumPriceView() {
    stackView.addArrangedSubview(premiumPriceView)
  }
  
  func setupSeparatorView() {
    addSubview(separatorView)
    separatorView.snp.makeConstraints {
      $0.centerX.top.bottom.equalTo(stackView)
    }
  }
}
