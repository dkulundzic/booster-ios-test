//
//  MapViewController.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import MapKit

protocol MapDisplayLogic: AnyObject {
  func displayInfoView(shown: Bool)
  func displaySelectionPin(shown: Bool)
}

class MapViewController: UIViewController {
  var presenter: MapViewPresentingLogic?
  private lazy var contentView = MapContentView()
  private var didShowInfoViewOnce = false
  
  override func loadView() {
    view = contentView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

// MARK: - MapDisplayLogic
extension MapViewController: MapDisplayLogic {
  func displayInfoView(shown: Bool) {
    contentView.isInfoViewHidden = !shown
  }
  
  func displaySelectionPin(shown: Bool) {
#warning("TODO:")
    print(#function)
  }
}

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
  func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
    guard fullyRendered && !didShowInfoViewOnce else { return }
    didShowInfoViewOnce = true
    presenter?.onMapFirstTimeRendering()
  }
}

private extension MapViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() {
    contentView.mapView.delegate = self
    contentView.actionTapHandler = { [weak self] in
#warning("TODO:")
      print(#function)
    }
    contentView.actionsView.homeButtonTapHandler = { [weak self] in
#warning("TODO:")
      print(#function)
    }
    contentView.actionsView.centerButtonTapHandler = { [weak self] in
#warning("TODO:")
      print(#function)
    }
  }
}
