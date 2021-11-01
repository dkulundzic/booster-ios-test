//
//  LocationManager.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import CoreLocation
import Combine

final class LocationManager: NSObject {
  private static let locationManager = CLLocationManager()
  private let locationSubject = CurrentValueSubject<CLLocation?, Never>(nil)
  private var bag = Set<AnyCancellable>()
  
  override init() {
    super.init()
    Self.locationManager.delegate = self
    Self.locationManager.requestWhenInUseAuthorization()
    Self.locationManager.requestLocation()
  }
  
  func start() {
    CLLocationManager.significantLocationChangeMonitoringAvailable() ? Self.locationManager.startMonitoringSignificantLocationChanges() : Self.locationManager.startUpdatingLocation()
  }
}

extension LocationManager {
  var locationPublisher: AnyPublisher<CLLocation?, Never> {
    locationSubject.eraseToAnyPublisher()
  }
  
  var currentCoordinate: CLLocationCoordinate2D? {
    locationSubject.value?.coordinate
  }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if status == .authorizedAlways || status == .authorizedWhenInUse {
       manager.startUpdatingLocation()
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else { return }
    manager.stopUpdatingLocation()
    locationSubject.value = location
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) { }
}
