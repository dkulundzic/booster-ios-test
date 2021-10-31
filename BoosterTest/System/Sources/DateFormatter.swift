//
//  DateFormatter.swift
//  System
//
//  Created by Domagoj Kulundzic on 31.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation

public final class DateFormatter {
  private static let dateFormatter: Foundation.DateFormatter = {
    let formatter = Foundation.DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter
  }()
  
  public init() { }
}

public extension DateFormatter {
  func format(date: Date?) -> String? {
    guard let date = date else { return nil }
    return Self.dateFormatter.string(from: date)
  }
}
