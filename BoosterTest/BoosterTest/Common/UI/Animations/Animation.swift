//
//  Animation.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation
import UIKit
import System

public struct Animation {
  public struct Parameters {
    public static let defaultDuration: TimeInterval = 0.3
    public static let defaultSpringDamping: CGFloat = 0.75
  }
}

public extension Animation {
  static func animation(
    duration: TimeInterval = Parameters.defaultDuration,
    delay: TimeInterval = 0.0,
    options: UIView.AnimationOptions = [],
    animations: @escaping Action,
    completion: ParametrisedAction<Bool>? = nil
  ) {
    UIView.animate(
      withDuration: duration,
      delay: delay,
      options: options,
      animations: animations,
      completion: completion
    )
  }
  
  static func spring(
    duration: TimeInterval = Parameters.defaultDuration,
    delay: TimeInterval = 0.0,
    damping: CGFloat = Parameters.defaultSpringDamping,
    velocity: CGFloat = 0.0,
    animations: @escaping Action,
    completion: ParametrisedAction<Bool>? = nil
  ) {
    UIView.animate(
      withDuration: duration,
      delay: delay,
      usingSpringWithDamping: damping,
      initialSpringVelocity: velocity,
      options: [],
      animations: animations,
      completion: completion
    )
  }
  
  static func transition(
    with view: UIView,
    duration: TimeInterval = Parameters.defaultDuration,
    animated: Bool = true,
    options: UIView.AnimationOptions = [.transitionCrossDissolve],
    animations: @escaping Action,
    completion: ParametrisedAction<Bool>? = nil
  ) {
    UIView.transition(
      with: view,
      duration: animated ? duration : 0.0,
      options: options,
      animations: animations,
      completion: completion
    )
  }
}
