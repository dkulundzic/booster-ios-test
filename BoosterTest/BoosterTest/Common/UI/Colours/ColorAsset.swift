//
//  ColorAsset.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import UIKit
import System

public protocol ColorAsset: Asset {
  var color: UIColor { get }
}

public extension ColorAsset where Self: RawRepresentable, RawValue == String {
  var name: String {
    rawValue
  }

  var color: UIColor {
    UIColor(named: rawValue) ?? .black
  }
}
