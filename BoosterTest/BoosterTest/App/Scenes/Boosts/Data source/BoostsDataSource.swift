//
//  BoostsDataSource.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import System
import Model
import Localization

enum BoostsDataSourceItem: Hashable {
  case boost(BoostsCell.ViewModel)
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

class BoostsDataSource: DataBackedDataSourceProtocol {
  private(set) var data = [Boost]()
  private(set) lazy var sections = [BoostsDataSourceSection]()
  private lazy var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter
  }()
  
  init() {
    buildSections()
  }
}

extension BoostsDataSource {
  func setBoosts(_ boosts: [Boost]) {
    data = boosts
    buildSections()
  }
}

private extension BoostsDataSource {
  func buildSections() {
    let items: [BoostsDataSourceItem] = data.map {
      let deliveryWindowText = try? AttributedStringBuilder(text: Localization.Boosts.deliveryWindowDetailFormat.localized($0.deliveryWindow.description))
        .setFont(.systemFont(ofSize: 16, weight: .regular))
        .setFont(.systemFont(ofSize: 16, weight: .bold), inRangeOf: $0.deliveryWindow.description)
        .create()
      let formattedDate = dateFormatter.string(from: $0.date)
      return BoostsDataSourceItem.boost(
        BoostsCell.ViewModel(
          id: $0.id,
          formattedDate: formattedDate,
          deliveryWindowText: deliveryWindowText,
          paymentMethodIcon: $0.paymentMethod.icon
        )
      )
    }
    sections = [.boosts(items)]
  }
}
