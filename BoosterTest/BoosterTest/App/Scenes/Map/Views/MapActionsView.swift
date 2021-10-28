//
//  MapActionsView.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import System

class MapActionsView: UIView {
  var homeButtonTapHandler: Action?
  var centerButtonTapHandler: Action?
  private lazy var stackView = UIStackView()
  private lazy var homeButton = UIButton(type: .system)
  private lazy var centerButton = UIButton(type: .system)
  private lazy var separatorView = UIView()
  private let buttonSize = CGSize(width: 50, height: 50)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MapActionsView {
  var isCenterButtonEnabled: Bool {
    get { centerButton.isEnabled }
    set { centerButton.isEnabled = newValue }
  }
}

private extension MapActionsView {
  @objc func homeButtonTapped() {
    homeButtonTapHandler?()
  }
  
  @objc func centerButtonTapped() {
    centerButtonTapHandler?()
  }
}

// MARK: - Private Methods
private extension MapActionsView {
  func setupViews() {
    setupView()
    setupStackView()
    setupHomeButton()
    setupCenterButton()
    setupSeparatorView()
  }
  
  func setupView() {
    backgroundColor = .white
    layer.cornerRadius = 8
    layer.borderColor = UIColor.lightGray.cgColor
    layer.borderWidth = 1
  }
  
  func setupStackView() {
    addSubview(stackView)
    stackView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.alignment = .fill
    stackView.spacing = 0
  }
  
  func setupHomeButton() {
    stackView.addArrangedSubview(homeButton)
    homeButton.snp.makeConstraints {
      $0.size.equalTo(buttonSize)
    }
    homeButton.tintColor = .darkGray
    homeButton.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
    homeButton.setImage(Icons.house.image, for: .normal)
  }
  
  func setupCenterButton() {
    stackView.addArrangedSubview(centerButton)
    centerButton.snp.makeConstraints {
      $0.size.equalTo(buttonSize)
    }
    centerButton.tintColor = .darkGray
    centerButton.addTarget(self, action: #selector(centerButtonTapped), for: .touchUpInside)
    centerButton.setImage(Icons.scope.image, for: .normal)
  }
  
  func setupSeparatorView() {
    addSubview(separatorView)
    separatorView.snp.makeConstraints {
      $0.centerX.top.bottom.equalTo(stackView)
      $0.width.equalTo(0.5)
    }
    separatorView.backgroundColor = .lightGray
  }
}
