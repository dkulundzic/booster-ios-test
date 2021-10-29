//
//  BoostsPresenter.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import Combine
import Model

protocol BoostsViewPresentingLogic: AnyObject {
  func onViewLoaded()
  func onCellSelected(at indexPath: IndexPath)
}

class BoostsPresenter {
  var interactor: BoostsBusinessLogic?
  weak private var view: BoostsDisplayLogic?
  private let router: BoostsRoutingLogic
  private let dataSource = BoostsDataSource()
  private let boostsStore: BoostsStoreProtocol
  private var bag = Set<AnyCancellable>()
  
  init(
    boostsStore: BoostsStoreProtocol = BoostsStore(),
    interface: BoostsDisplayLogic,
    interactor: BoostsBusinessLogic?,
    router: BoostsRoutingLogic
  ) {
    self.boostsStore = boostsStore
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - BoostsViewPresentingLogic
extension BoostsPresenter: BoostsViewPresentingLogic {
  func onViewLoaded() {
    setupObserving()
  }
  
  func onCellSelected(at indexPath: IndexPath) {
    guard let boost = dataSource.element(at: indexPath) else { return }
    router.showBoostDetails(for: boost)
  }
}

private extension BoostsPresenter {
  func setupObserving() {
    boostsStore.boostsPublisher
      .receive(on: DispatchQueue.main)
      .sink { [weak self] boosts in
        guard let strongSelf = self else { return }
        strongSelf.dataSource.setBoosts(boosts)
        strongSelf.view?.displayBoosts(using: strongSelf.dataSource)
      }
      .store(in: &bag)
  }
}
