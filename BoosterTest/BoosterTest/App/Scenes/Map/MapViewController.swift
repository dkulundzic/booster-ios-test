//
//  MapViewController.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

protocol MapDisplayLogic: AnyObject { }

class MapViewController: UIViewController {
  var presenter: MapViewPresentingLogic?
  private lazy var contentView = MapContentView()

  override func loadView() {
    view = contentView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

// MARK: - MapDisplayLogic
extension MapViewController: MapDisplayLogic { }

private extension MapViewController {
  func setupView() { }
}
