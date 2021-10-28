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
  private(set) lazy var mapView = MKMapView()
  private lazy var actionButton = ActionButton()
  private lazy var blurView = UIVisualEffectView(effect: blurEffect)
  private lazy var vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
  private lazy var infoView = InfoView()
  private lazy var selectionPinView = MapSelectionPinView()
  private let blurEffect = UIBlurEffect(style: .systemChromeMaterial)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MapContentView {
  var isInfoViewHidden: Bool {
    get {
      blurView.alpha != 0      
    }
    set {
      Animation.animation {
        self.blurView.alpha = newValue ? 0.0 : 1.0
        self.blurView.setNeedsLayout()        
      }
    }
  }
  
  var isSelectionPinViewHidden: Bool {
    get {
      selectionPinView.alpha != 0
    }
    set {
      Animation.animation {
        self.selectionPinView.alpha = newValue ? 0.0 : 1.0
      }
    }
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
    setupBlurView()
    setupVibrancyView()
    setupInfoView()
    setupSelectionPinView()
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
    mapView.mapType = .satelliteFlyover
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
  
  func setupBlurView() {
    addSubview(blurView)
    blurView.snp.makeConstraints {
      $0.leading.trailing.top.equalTo(safeAreaLayoutGuide).inset(16)
    }
    blurView.clipsToBounds = true
    blurView.isUserInteractionEnabled = false
    blurView.alpha = 0.0
    blurView.layer.cornerRadius = 8
  }
  
  func setupVibrancyView() {
    blurView.contentView.addSubview(vibrancyView)
    vibrancyView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  func setupInfoView() {
    vibrancyView.contentView.addSubview(infoView)
    infoView.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(10)
    }
    infoView.title = Localization.Map.infoTitle.localized()
    infoView.subtitle = Localization.Map.infoSubtitle.localized()
  }
  
  func setupSelectionPinView() {
    addSubview(selectionPinView)
    selectionPinView.snp.makeConstraints {
      $0.center.equalTo(mapView.readableContentGuide)
    }
    selectionPinView.alpha = 0.0
  }
}
