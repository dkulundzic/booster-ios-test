//
//  UIView-BoosterTest.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 01.11.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

public extension UIView {
  func dropShadow(
    shadowPath: CGPath? = nil,
    shadowRadius: CGFloat = 16,
    shadowOpacity: Float = 0.25,
    shadowColor: UIColor = .black
  ) {
    layer.shadowPath = shadowPath
    layer.shadowRadius = shadowRadius
    layer.shadowOpacity = shadowOpacity
    layer.shadowColor = shadowColor.cgColor
  }
}
