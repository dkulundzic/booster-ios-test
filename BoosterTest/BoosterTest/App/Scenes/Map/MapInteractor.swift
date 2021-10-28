//
//  MapInteractor.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import CoreLocation
import Combine

protocol MapBusinessLogic: AnyObject {
  var userLocationPublisher: AnyPublisher<CLLocation?, Never> { get }
  var userLocation: CLLocationCoordinate2D? { get }
}

class MapInteractor {
  private let locationManager = LocationManager()
}

// MARK: - MapBusinessLogic
extension MapInteractor: MapBusinessLogic {
  var userLocationPublisher: AnyPublisher<CLLocation?, Never> {
    locationManager.locationPublisher
  }
  
  var userLocation: CLLocationCoordinate2D? {
    locationManager.currentCoordinate
  }
}
