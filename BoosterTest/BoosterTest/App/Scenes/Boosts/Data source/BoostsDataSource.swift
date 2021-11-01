//
//  BoostsDataSource.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import Combine
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
  var data: [Boost] { dataSubject.value }
  var sections: [BoostsDataSourceSection] { sectionSubject.value }
  private let dataSubject = CurrentValueSubject<[Boost], Never>([])
  private let sectionSubject = CurrentValueSubject<[BoostsDataSourceSection], Never>([])
  private let dateFormatter = System.DateFormatter()
  private var bag = Set<AnyCancellable>()
  
  init() {
    setupObserving()
  }
}

extension BoostsDataSource {
  var sectionsPublisher: AnyPublisher<Void, Never> {
    sectionSubject
      .map { _ in }
      .eraseToAnyPublisher()
  }
  
  func setBoosts(_ boosts: [Boost]) {
    dataSubject.value = boosts
  }
  
  func remove(boost: Boost) {
    guard let indexOf = dataSubject.value.firstIndex(of: boost) else { return }
    dataSubject.value.remove(at: indexOf)
  }
}

private extension BoostsDataSource {
  func setupObserving() {
    dataSubject
      .sink { [weak self] _ in
        self?.buildSections()
      }
      .store(in: &bag)
  }
  
  func buildSections() {
    let items: [BoostsDataSourceItem] = dataSubject.value.map {
      let deliveryWindowText = try? AttributedStringBuilder(text: Localization.Boosts.deliveryWindowDetailFormat.localized($0.deliveryWindow.description))
        .setFont(.systemFont(ofSize: 16, weight: .regular))
        .setFont(.systemFont(ofSize: 16, weight: .bold), inRangeOf: $0.deliveryWindow.description)
        .create()
      let formattedDate = dateFormatter.format(date: $0.date)
      return BoostsDataSourceItem.boost(
        BoostsCell.ViewModel(
          id: $0.id,
          formattedDate: formattedDate,
          deliveryWindowText: deliveryWindowText,
          paymentMethodIcon: $0.paymentMethod.icon
        )
      )
    }
    sectionSubject.value = [.boosts(items)]
  }
}
