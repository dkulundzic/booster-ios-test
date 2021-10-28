//
//  ActionButton.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Martian & Machine. All rights reserved.
//

import Foundation
import UIKit

public final class ActionButton: GradientButton {
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  @available(*, unavailable)
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override var intrinsicContentSize: CGSize {
    CGSize(width: UIView.noIntrinsicMetric, height: 56)
  }
}

// MARK: - Private Methods
private extension GradientButton {
  func setupViews() {
    setupView()
  }
  
  func setupView() {
    titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
    colors = [Colors.General.lightPurple.color, Colors.General.purple.color]
    setTitleColor(.white, for: .normal)
    layer.cornerRadius = 6
  }
}
