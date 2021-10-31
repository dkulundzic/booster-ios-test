//
//  BoostsStore.swift
//  Model
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import Combine

public protocol BoostsStoreProtocol {
  var boostsPublisher: AnyPublisher<[Boost], Never> { get }
  func add(boost: Boost)
  func remove(boost: Boost)
}

public final class BoostsStore {
  private static let boostsSubject = CurrentValueSubject<[Boost], Never>(
    [
      .init(date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, deliveryWindow: .afternoon, paymentMethod: .creditCard),
      .init(date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!, deliveryWindow: .morning, paymentMethod: .cash),
      .init(date: Calendar.current.date(byAdding: .day, value: 5, to: Date())!, deliveryWindow: .morning, paymentMethod: .cash),
      .init(date: Calendar.current.date(byAdding: .day, value: 12, to: Date())!, deliveryWindow: .afternoon, paymentMethod: .creditCard)
    ].sorted(by: { $0.date < $1.date })
  )
  
  public init() { }
}

extension BoostsStore: BoostsStoreProtocol {
  public var boostsPublisher: AnyPublisher<[Boost], Never> {
    Self.boostsSubject.eraseToAnyPublisher()
  }
  
  public func add(boost: Boost) {
    Self.boostsSubject.value.append(boost)
    Self.boostsSubject.value.sort(by: { $0.date < $1.date })
  }
  
  public func remove(boost: Boost) {
    guard let indexOf = Self.boostsSubject.value.firstIndex(of: boost) else { return }
    Self.boostsSubject.value.remove(at: indexOf)
  }
}
