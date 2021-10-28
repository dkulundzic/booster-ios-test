//
//  Localization.swift
//  Localization
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Martian & Machine. All rights reserved.
//

import Foundation

public struct Localization {
  public enum Map: String, LocalizationAsset {
    case title = "map_title"
  }
  
  public enum Boosts: String, LocalizationAsset {
    case title = "boosts_title"
  }
}
