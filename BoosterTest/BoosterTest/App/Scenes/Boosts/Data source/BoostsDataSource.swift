//
//  BoostsDataSource.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

enum BoostsDataSourceItem {
  case boost
}

enum BoostsDataSourceSection: SectionProtocol {
  case boosts([BoostsDataSourceItem])
  
  var items: [BoostsDataSourceItem] {
    switch self {
    case .boosts(let items):
      return items
    }
  }
}

class BoostsDataSource: DataSourceProtocol {
  private(set) lazy var sections = [BoostsDataSourceSection]()
  
  init() {
    buildSections()
  }
}

private extension BoostsDataSource {
  func buildSections() {
    sections.removeAll()
  }
}
