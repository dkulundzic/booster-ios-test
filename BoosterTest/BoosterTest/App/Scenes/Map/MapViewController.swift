//
//  MapViewController.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import MapKit
import Localization

protocol MapDisplayLogic: AnyObject {
  func displayInfoView(shown: Bool)
  func displaySelectionPin(shown: Bool)
  func displayCenteringButton(enabled: Bool)
  func displayActionButton(enabled: Bool)
  func displayMapCenteringOnUser(using userLocation: CLLocationCoordinate2D)
  func displayFuelInformation(regularPricing: MapFuelPricingView.ViewModel, premiumPricing: MapFuelPricingView.ViewModel)
  func displayFuelInformationLoading(inProgress: Bool)
}

class MapViewController: ContentViewController<MapContentView> {
  override var isNavigationBarHidden: Bool? { true }
  var presenter: MapViewPresentingLogic?
  private var didShowInfoViewOnce = false
  private var didCenterOnUserOnce = false
  private var didShowActivityIndicatorOnce = false
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupNavigationBar()
    presenter?.onViewLoaded()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter?.onViewWillAppear()
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
  
  func displayActionButton(enabled: Bool) {
    contentView.isActionButtonEnabled = enabled
  }
  
  func displayMapCenteringOnUser(using userLocation: CLLocationCoordinate2D) {
    contentView.mapView.setRegion(createMapViewRegion(for: userLocation), animated: true)
  }
  
  func displayFuelInformation(regularPricing: MapFuelPricingView.ViewModel, premiumPricing: MapFuelPricingView.ViewModel) {
    contentView.fuelInformationView.regularPriceView.update(regularPricing)
    contentView.fuelInformationView.premiumPriceView.update(premiumPricing)
  }
  
  func displayFuelInformationLoading(inProgress: Bool) {
    contentView.isLoadingFuelInformation = inProgress && !didShowActivityIndicatorOnce
    if inProgress { didShowActivityIndicatorOnce = true }
  }
}

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    presenter?.onUserSelectedBoostLocation(mapView.centerCoordinate)
  }
  
  func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
    guard !didShowInfoViewOnce else { return }
    didShowInfoViewOnce = true
    presenter?.onMapFirstTimeRendering()
  }
  
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
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
      self?.presenter?.onActionButtonTapped()
    }
    contentView.actionsView.homeButtonTapHandler = { [weak self] in
      self?.presenter?.onHomeButtonTapped()
    }
    contentView.actionsView.centerButtonTapHandler = { [weak self] in
      self?.presenter?.onCenterButtonTapped()
    }
  }
  
  func setupNavigationBar() {
    navigationItem.title = Localization.Map.title.localized()
  }
  
  func createMapViewRegion(for location: CLLocationCoordinate2D) -> MKCoordinateRegion {
    MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
  }
}
