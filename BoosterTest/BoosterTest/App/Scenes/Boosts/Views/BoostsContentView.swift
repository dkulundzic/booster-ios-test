//
//  BoostsContentView.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

class BoostsContentView: UIView {
  private(set) lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  private lazy var layout = ListLayoutVendor(
    estimatedItemHeight: estimatedCellHeight,
    sectionInsets: NSDirectionalEdgeInsets(top: cellSpacing, leading: cellSpacing, bottom: cellSpacing, trailing: cellSpacing),
    interGroupSpacing: cellSpacing
  ).vendLayout()
  private let estimatedCellHeight: CGFloat = 60
  private let cellSpacing: CGFloat = 16
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
private extension BoostsContentView {
  func setupViews() {
    setupView()
    setupCollectionView()
  }
  
  func setupView() {
    backgroundColor = Colors.General.background.color
  }
  
  func setupCollectionView() {
    addSubview(collectionView)
    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    collectionView.backgroundColor = .white
    collectionView.alwaysBounceVertical = true
    collectionView.register(BoostsCell.self)
  }
}
