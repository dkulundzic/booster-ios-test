//
//  MapRouter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

protocol MapRoutingLogic: AnyObject { }

protocol MapRouterDelegate: AnyObject { }

class MapRouter {
  weak var viewController: MapViewController?
  weak var delegate: MapRouterDelegate?
  
  static func createModule(delegate: MapRouterDelegate?) -> MapViewController {
    let view = MapViewController(nibName: nil, bundle: nil)
    let interactor = MapInteractor()
    let router = MapRouter()
    router.delegate = delegate
    router.viewController = view
    let presenter = MapPresenter(interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}

// MARK: - MapRoutingLogic
extension MapRouter: MapRoutingLogic { }
