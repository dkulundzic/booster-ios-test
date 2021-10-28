//
//  GradientButton.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Martian & Machine. All rights reserved.
//

import UIKit

open class GradientButton: UIButton {
  private lazy var gradientLayer = CAGradientLayer()
  
  open override var bounds: CGRect {
    didSet { gradientLayer.frame = bounds }
  }
  
  open override var frame: CGRect {
    didSet { gradientLayer.frame = frame }
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  @available(*, unavailable)
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    gradientLayer.frame = bounds
  }
}

public extension GradientButton {
  var colors: [UIColor]? {
    get {
      guard let cgColors = gradientLayer.colors as? [CGColor] else {
        return nil
      }
      return cgColors.map { UIColor(cgColor: $0) }
    }
    set {
      gradientLayer.colors = newValue?.map { $0.cgColor }
    }
  }
}

// MARK: - Private Methods
private extension GradientButton {
  func setupViews() {
    setupView()
    setupGradientLayer()
  }
  
  func setupView() {
    clipsToBounds = true
  }
  
  func setupGradientLayer() {
    layer.insertSublayer(gradientLayer, at: 0)
    gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
  }
}
