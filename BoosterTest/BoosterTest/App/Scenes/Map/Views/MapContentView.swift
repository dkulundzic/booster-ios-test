//
//  MapContentView.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import MapKit
import System
import Localization
import SnapKit

class MapContentView: UIView {
  var actionTapHandler: Action?
  private(set) lazy var actionsView = MapActionsView()
  private lazy var mapView = MKMapView()
  private lazy var actionButton = ActionButton(type: .system)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Actions
private extension MapContentView {
  @objc func actionButtonTapped() {
    actionTapHandler?()
  }
}

// MARK: - Private Methods
private extension MapContentView {
  func setupViews() {
    setupView()
    setupMapView()
    setupActionsView()
    setupActionButton()
  }
  
  func setupView() {
    backgroundColor = .white
  }
  
  func setupMapView() {
    addSubview(mapView)
    mapView.snp.makeConstraints {
      $0.leading.trailing.top.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.7)
    }
    mapView.showsUserLocation = true
    mapView.mapType = .hybrid
    mapView.layer.cornerRadius = 8
  }
  
  func setupActionsView() {
    addSubview(actionsView)
    actionsView.snp.makeConstraints {
      $0.trailing.bottom.equalTo(mapView).inset(16)
    }
  }
  
  func setupActionButton() {
    addSubview(actionButton)
    actionButton.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16)
      $0.bottom.equalTo(safeAreaLayoutGuide).inset(16)
    }
    actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    actionButton.setTitle(Localization.Actions.next.localized(), for: .normal)
  }
}
