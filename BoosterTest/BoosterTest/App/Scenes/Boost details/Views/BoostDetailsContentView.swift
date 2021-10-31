//
//  BoostDetailsContentView.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

class BoostDetailsContentView: UIView {
  private lazy var cardContainerView = CardContainerView()
  
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
private extension BoostDetailsContentView {
  func setupViews() {
    setupView()
    setupCardContainerView()
  }
  
  func setupView() {
    backgroundColor = Colors.General.background.color
  }
  
  func setupCardContainerView() {
    addSubview(cardContainerView)
    cardContainerView.snp.makeConstraints {
      $0.leading.top.trailing.equalToSuperview().inset(16)
      $0.height.equalToSuperview().multipliedBy(0.5)
    }
  }
}
