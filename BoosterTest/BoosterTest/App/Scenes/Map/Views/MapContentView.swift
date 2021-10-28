//
//  MapContentView.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import MapKit
import SnapKit

class MapContentView: UIView {
  private(set) lazy var actionsView = MapActionsView()
  private lazy var mapView = MKMapView()
  
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
private extension MapContentView {
  func setupViews() {
    setupView()
    setupMapView()
    setupActionsView()
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
}
