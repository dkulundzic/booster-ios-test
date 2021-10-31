//
//  BoostsCellProvider.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 31.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import UIKit

struct BoostsCellProvider {
  func provideCell(
    for collectionView: UICollectionView,
    at indexPath: IndexPath,
    for item: BoostsDataSourceItem
  ) -> UICollectionViewCell {
    switch item {
    case .boost(let viewModel):
      let cell = collectionView.dequeueReusableCell(BoostsCell.self, at: indexPath)
      cell.update(viewModel)
      return cell
    }
  }
}
