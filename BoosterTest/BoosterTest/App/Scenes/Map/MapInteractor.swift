//
//  MapInteractor.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import CoreLocation

protocol MapBusinessLogic: AnyObject {
  func requestLocationAuthorization()
}

class MapInteractor {
  private let locationManager = CLLocationManager()
}

// MARK: - MapBusinessLogic
extension MapInteractor: MapBusinessLogic {
  func requestLocationAuthorization() {
    locationManager.requestWhenInUseAuthorization()
  }
}
