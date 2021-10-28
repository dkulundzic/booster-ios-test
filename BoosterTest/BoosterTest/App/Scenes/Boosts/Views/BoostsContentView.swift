//
//  BoostsContentView.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

class BoostsContentView: UIView {
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
private extension BoostsContentView {
  func setupViews() {
    setupView()
  }
  
  func setupView() {
    backgroundColor = Colors.General.background.color
  }
}
