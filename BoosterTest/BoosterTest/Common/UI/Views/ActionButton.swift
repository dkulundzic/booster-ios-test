//
//  ActionButton.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
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
  
  public override var isHighlighted: Bool {
    didSet { applyHighlightIfNeeded(wasHighlighted: oldValue, isHighlighted: isHighlighted) }
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
    setTitleColor(.white.withAlphaComponent(0.5), for: .disabled)
    layer.cornerRadius = 6
  }
  
  func applyHighlightIfNeeded(wasHighlighted: Bool, isHighlighted: Bool) {
    guard wasHighlighted != isHighlighted else { return }
    Animation.animation(duration: 0.1) {
      self.titleLabel?.alpha = self.isHighlighted ? 0.5 : 1
    }
  }
}
