//
//  Colors.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation

public struct Colors {
  public enum General: String, ColorAsset {
    case background
    case lightPurple
    case purple
  }
  
  public enum Text: String, ColorAsset {
    case labelPrimary
    case labelSecondary
    case labelTertiary
  }
  
  public enum Views: String, ColorAsset {
    case borderColor
    case tintColor
    case separatorBackground
    case shadowColor
  }
}
