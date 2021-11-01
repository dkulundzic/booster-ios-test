//
//  BoostsStore.swift
//  Model
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import Combine
import Localization

public protocol BoostsStoreProtocol {
  var boostsPublisher: AnyPublisher<[Boost], Never> { get }
  var boosts: [Boost] { get }
  func add(boost: Boost) throws
  func remove(boost: Boost)
}

public final class BoostsStore {
  public enum Error: LocalizedError {
    case alreadyExistsForGivenDate
    
    public var errorDescription: String? {
      switch self {
      case .alreadyExistsForGivenDate:
        return Localization.Errors.boostExistsForSelectedDate.localized()
      }
    }
  }
  
  private static let boostsSubject = CurrentValueSubject<[Boost], Never>([])
  
  public init() { }
}

extension BoostsStore: BoostsStoreProtocol {
  public var boostsPublisher: AnyPublisher<[Boost], Never> {
    Self.boostsSubject.eraseToAnyPublisher()
  }
  
  public var boosts: [Boost] {
    Self.boostsSubject.value
  }
  
  public func add(boost: Boost) throws {
    guard !boosts.contains(where: { Calendar.current.isDate(boost.date, inSameDayAs: $0.date) }) else {
      throw Error.alreadyExistsForGivenDate
    }
    Self.boostsSubject.value.append(boost)
    Self.boostsSubject.value.sort(by: { $0.date < $1.date })
  }
  
  public func remove(boost: Boost) {
    guard let indexOf = Self.boostsSubject.value.firstIndex(of: boost) else { return }
    Self.boostsSubject.value.remove(at: indexOf)
  }
}
