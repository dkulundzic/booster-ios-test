//
//  ContentViewController.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 27.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

open class UIContentViewController<ContentView: UIView>: UIViewController {
  public private(set) lazy var contentView = ContentView()

  open override func loadView() {
    view = contentView
  }
}

open class UIContentPageViewController<ContentView: UIView>: UIPageViewController {
  public private(set) lazy var contentView = ContentView()

  open override func loadView() {
    view = contentView
  }
}

open class ContentViewController<ContentView: UIView>: ViewController {
  public private(set) lazy var contentView = ContentView()

  open override func loadView() {
    view = contentView
  }
}
