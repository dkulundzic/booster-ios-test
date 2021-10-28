//
//  BoosterAppRouter.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 27.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import UIKit

final class BoosterAppRouter {
  func initialViewController() -> UIViewController {
    TabBarRouter.createModule(delegate: self)
  }
}

// MARK: - TabBarRouterDelegate
extension BoosterAppRouter: TabBarRouterDelegate { }
