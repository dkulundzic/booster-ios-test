//
//  MapSelectionPinView.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

#warning("NOTE: A more precise image for the pin is advised.")
class MapSelectionPinView: UIView {
  private lazy var pinImageView = UIImageView(image: Icons.car.image)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override var bounds: CGRect {
    didSet { layer.cornerRadius = bounds.width / 2 }
  }
  
  override var frame: CGRect {
    didSet { layer.cornerRadius = frame.width / 2 }
  }
}

// MARK: - Private Methods
private extension MapSelectionPinView {
  func setupViews() {
    setupView()
    setupPinImageView()
  }
  
  func setupView() {
    backgroundColor = Colors.General.purple.color
    layer.borderWidth = 1.0
    layer.borderColor = UIColor.white.cgColor
  }
  
  func setupPinImageView() {
    addSubview(pinImageView)
    pinImageView.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(8)
    }
    pinImageView.contentMode = .scaleAspectFit
    pinImageView.tintColor = .white
  }
}
