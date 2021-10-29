//
//  Localization.swift
//  Localization
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation

public struct Localization {
  public enum Actions: String, LocalizationAsset {
    case next = "action_next"
    case orderBoost = "action_order_boost"
  }
  
  public enum Map: String, LocalizationAsset {
    case title = "map_title"
    case infoTitle = "map_info_title"
    case infoSubtitle = "map_info_subtitle"
  }
  
  public enum Boosts: String, LocalizationAsset {
    case title = "boosts_title"
  }
}
