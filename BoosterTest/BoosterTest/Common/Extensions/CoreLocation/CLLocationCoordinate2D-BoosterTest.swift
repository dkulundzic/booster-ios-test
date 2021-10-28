//
//  CLLocationCoordinate2D-BoosterTest.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import CoreLocation

extension CLLocationCoordinate2D {
  func isSortOfEqual(to coordinate: CLLocationCoordinate2D) -> Bool {
    let distanceThreshold: CLLocationDistance = 2.0 // In meters
    let lhsLocation = CLLocation(latitude: latitude, longitude: longitude)
    let rhsLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
    return rhsLocation.distance(from: lhsLocation) < distanceThreshold
  }
}
