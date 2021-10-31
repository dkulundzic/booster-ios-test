//
//  MapFuelPricingView.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

class MapFuelPricingView: UIView {
  struct ViewModel {
    let title: String?
    let formattedPrice: String?
  }
  
  private lazy var infoView = InfoView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MapFuelPricingView {
  func update(_ viewModel: ViewModel) {
    infoView.title = viewModel.title
    infoView.subtitle = viewModel.formattedPrice
  }
}

// MARK: - Private Methods
private extension MapFuelPricingView {
  func setupViews() {
   setupInfoView()
  }
  
  func setupInfoView() {
    addSubview(infoView)
    infoView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    infoView.titleFont = .systemFont(ofSize: 18, weight: .regular)
    infoView.titleColor = Colors.Text.labelSecondary.color
    infoView.titleAlignmnent = .center
    infoView.subtitleFont = .systemFont(ofSize: 22, weight: .medium)
    infoView.subtitleColor = Colors.Text.labelPrimary.color
    infoView.subtitleAlignmnent = .center
  }
}
