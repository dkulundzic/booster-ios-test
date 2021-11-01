//
//  Error-BoosterTest.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 31.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import Localization

public extension Error {
  var localized: String {
    (self as? LocalizedError)?.errorDescription ?? Localization.Errors.generic.localized()
  }
}
