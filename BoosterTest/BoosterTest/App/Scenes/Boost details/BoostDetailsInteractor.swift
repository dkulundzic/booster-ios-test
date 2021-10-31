//
//  BoostDetailsInteractor.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import Networking
import Model

protocol BoostDetailsBusinessLogic: AnyObject {
  func cancelBoost(_ boost: Boost) async
}

class BoostDetailsInteractor {
  private let boostService: BoostServiceProtocol
  
  init(boostService: BoostServiceProtocol = BoostService()) {
    self.boostService = boostService
  }
}

// MARK: - BoostDetailsBusinessLogic
extension BoostDetailsInteractor: BoostDetailsBusinessLogic {
  func cancelBoost(_ boost: Boost) async {
    await boostService.cancelBoost(boost)
  }
}
