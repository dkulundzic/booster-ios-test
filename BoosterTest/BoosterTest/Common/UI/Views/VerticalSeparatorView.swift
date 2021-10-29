//
//  VerticalSeparatorView.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import UIKit

class VerticalSeparatorView: UIView {
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
private extension VerticalSeparatorView {
  func setupViews() {
    setupView()
  }
  
  func setupView() {
    snp.makeConstraints {
      $0.width.equalTo(0.5)
    }
    backgroundColor = .lightGray
  }
}
