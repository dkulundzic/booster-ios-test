//
//  BoostsViewController.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import Localization

protocol BoostsDisplayLogic: AnyObject {
  func displayBoosts(using dataSource: BoostsDataSource)
}

class BoostsViewController: UIContentViewController<BoostsContentView> {
  var presenter: BoostsViewPresentingLogic?
  private var dataSource: BoostsDataSource?
  private lazy var diffableDataSource = UICollectionViewDiffableDataSource<Int, BoostsDataSourceItem>(collectionView: contentView.collectionView) { collectionView, indexPath, item in
    switch item {
    case .boost(let viewModel):
      let cell = collectionView.dequeueReusableCell(BoostsCell.self, at: indexPath)
      cell.update(viewModel)
      return cell
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupNavigationBar()
    presenter?.onViewLoaded()
  }
}

// MARK: - BoostsDisplayLogic
extension BoostsViewController: BoostsDisplayLogic {
  func displayBoosts(using dataSource: BoostsDataSource) {
    diffableDataSource.apply(dataSource.snapshot)
  }
}

// MARK: - UICollectionViewDelegate
extension BoostsViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presenter?.onCellSelected(at: indexPath)
  }
}

private extension BoostsViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() {
    contentView.collectionView.delegate = self
  }
  
  func setupNavigationBar() {
    navigationItem.title = Localization.Boosts.title.localized()
  }
}
