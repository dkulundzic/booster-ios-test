//
//  File.swift
//  GixonUI
//
//  Created by Domagoj Kulundzic on 12/06/2020.
//  Copyright © 2020 Codeopolis. All rights reserved.
//

import UIKit

public extension UINavigationBarAppearance {
  static func defaultStandard(shadowColor: UIColor = .lightGray) -> UINavigationBarAppearance {
    let appearance = UINavigationBarAppearance()
    appearance.backgroundColor = .white
    appearance.shadowColor = shadowColor
    appearance.titleTextAttributes = [
      NSAttributedString.Key.foregroundColor: UIColor.black
    ]
    return appearance
  }

  static func defaultStandardWithoutBorder() -> UINavigationBarAppearance {
    Self.defaultStandard(shadowColor: .clear)
  }
}
