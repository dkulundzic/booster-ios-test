//
//  MapRouter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import CoreLocation

protocol MapRoutingLogic: AnyObject {
  func showBoostRequestScene(using boostLocation: CLLocationCoordinate2D)
}

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
extension MapRouter: MapRoutingLogic {
  func showBoostRequestScene(using boostLocation: CLLocationCoordinate2D) {
    let boosterRequestScene = BoostRequestRouter.createModule(boostLocation: boostLocation, delegate: self)
    boosterRequestScene.hidesBottomBarWhenPushed = true
    viewController?.navigationController?.pushViewController(boosterRequestScene, animated: true)
  }
}

// MARK: - BoostRequestRouterDelegate
extension MapRouter: BoostRequestRouterDelegate { }
