//
//  CardContainerView.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 31.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

open class CardContainerView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  @available(*, unavailable)
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open override var bounds: CGRect {
    didSet { dropShadow(shadowPath: UIBezierPath(rect: bounds).cgPath) }
  }
  
  open override var frame: CGRect {
    didSet { dropShadow(shadowPath: UIBezierPath(rect: frame).cgPath) }
  }
}

extension CardContainerView {
  func embedView(
    _ view: UIView,
    using margins: UIEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
  ) {
    guard !view.isDescendant(of: self) else { return }
    addSubview(view)
    view.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(margins)
    }
  }
}

// MARK: - Private Methods
private extension CardContainerView {
  func setupViews() {
    setupView()
  }
  
  func setupView() {
    backgroundColor = Colors.General.background.color
    layer.cornerRadius = 8
  }
}
