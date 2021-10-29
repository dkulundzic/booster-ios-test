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
import Model
import Networking

protocol MapBusinessLogic: AnyObject {
  var userLocationPublisher: AnyPublisher<CLLocation?, Never> { get }
  var userLocation: CLLocationCoordinate2D? { get }
  func loadFuelPricingInformation() async -> FuelPricingInformation
}

class MapInteractor {
  private let locationManager = LocationManager()
  private let fuelInformationService: FuelInformationServiceProtocol
  
  init(fuelInformationService: FuelInformationServiceProtocol = FuelInformationService()) {
    self.fuelInformationService = fuelInformationService
  }
}

// MARK: - MapBusinessLogic
extension MapInteractor: MapBusinessLogic {
  var userLocationPublisher: AnyPublisher<CLLocation?, Never> {
    locationManager.locationPublisher
  }
  
  var userLocation: CLLocationCoordinate2D? {
    locationManager.currentCoordinate
  }
  
  func loadFuelPricingInformation() async -> FuelPricingInformation {
    await fuelInformationService.loadFuelInformation()
  }
}
