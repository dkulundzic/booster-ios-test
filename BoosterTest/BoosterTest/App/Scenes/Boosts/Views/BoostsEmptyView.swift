//
//  BoostsEmptyView.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import Localization

class BoostsEmptyView: UIView {
  private lazy var messageLabel = UILabel()
  
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
private extension BoostsEmptyView {
  func setupViews() {
    setupMessageLabel()
  }
  
  func setupMessageLabel() {
    addSubview(messageLabel)
    messageLabel.snp.makeConstraints {
      $0.leadingMargin.trailingMargin.equalToSuperview()
      $0.centerY.equalToSuperview().multipliedBy(0.75)
    }
    messageLabel.text = Localization.Boosts.emptyMessage.localized()
    messageLabel.textColor = .label
    messageLabel.textAlignment = .center
    messageLabel.font = .systemFont(ofSize: 24, weight: .medium)
  }
}
