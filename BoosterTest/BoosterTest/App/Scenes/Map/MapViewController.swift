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
  func displayCenteringButton(enabled: Bool)
  func displayMapCenteringOnUser(using userLocation: CLLocationCoordinate2D)
}

class MapViewController: UIContentViewController<MapContentView> {
  var presenter: MapViewPresentingLogic?
  private var didShowInfoViewOnce = false
  private var didCenterOnUserOnce = false
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    presenter?.onViewLoaded()
  }
}

// MARK: - MapDisplayLogic
extension MapViewController: MapDisplayLogic {
  func displayInfoView(shown: Bool) {
    contentView.isInfoViewHidden = !shown
  }
  
  func displaySelectionPin(shown: Bool) {
    contentView.isSelectionPinViewHidden = !shown
  }
  
  func displayCenteringButton(enabled: Bool) {
    contentView.actionsView.isCenterButtonEnabled = enabled
  }
  
  func displayMapCenteringOnUser(using userLocation: CLLocationCoordinate2D) {
    contentView.mapView.setRegion(createMapViewRegion(for: userLocation), animated: true)
  }
}

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
  func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
    guard fullyRendered && !didShowInfoViewOnce else { return }
    didShowInfoViewOnce = true
    presenter?.onMapFirstTimeRendering()
  }
  
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    presenter?.onMapUpdatedUserLocation(userLocation.coordinate)
    
    guard !didCenterOnUserOnce else { return }
    didCenterOnUserOnce = true
    mapView.setRegion(createMapViewRegion(for: userLocation.coordinate), animated: true)
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
      self?.presenter?.onCenterButtonTapped()
    }
  }
  
  func createMapViewRegion(for location: CLLocationCoordinate2D) -> MKCoordinateRegion {
    MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
  }
}
