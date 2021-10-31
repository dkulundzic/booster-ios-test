//
//  MapRouter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import CoreLocation
import Model

protocol MapRoutingLogic: AnyObject {
  func showBoostRequestScene(using boostLocation: CLLocationCoordinate2D)
  func showBoostDetails(for boost: Boost)
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
    let boostRequestScene = BoostRequestRouter.createModule(boostLocation: boostLocation, delegate: self)
    boostRequestScene.hidesBottomBarWhenPushed = true
    viewController?.navigationController?.pushViewController(boostRequestScene, animated: true)
  }
  
  func showBoostDetails(for boost: Boost) {
    let boostDetailsScene = BoostDetailsRouter.createModule(boost: boost, delegate: self)
    boostDetailsScene.hidesBottomBarWhenPushed = true
    viewController?.navigationController?.pushViewController(boostDetailsScene, animated: true)
  }
}

// MARK: - BoostRequestRouterDelegate
extension MapRouter: BoostRequestRouterDelegate {
  func boostRequestDelegateOrderedBoost(_ boost: Boost) {
    viewController?.navigationController?.popViewController(animated: false)
    viewController?.presenter?.onBoostOrdered(boost)
  }
  
  func boostRequestDelegateRequestedDismissal() {
    viewController?.navigationController?.popViewController(animated: true)
  }
}

// MARK: - BoostDetailsRouterDelegate
extension MapRouter: BoostDetailsRouterDelegate { }
