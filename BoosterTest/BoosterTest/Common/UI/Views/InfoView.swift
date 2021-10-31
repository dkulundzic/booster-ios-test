//
//  InfoView.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import System

open class InfoView: UIView {
  public private(set) lazy var titleLabel = UILabel()
  private(set) lazy var subtitleLabel = UILabel()
  private lazy var stackView = UIStackView()

  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

public extension InfoView {
  var axis: NSLayoutConstraint.Axis {
    get { return stackView.axis }
    set { stackView.axis = newValue }
  }

  var spacing: CGFloat {
    get { return stackView.spacing }
    set { stackView.spacing = newValue }
  }

  var title: String? {
    get { return titleLabel.text }
    set { titleLabel.text = newValue }
  }

  var titleFont: UIFont? {
    get { return titleLabel.font }
    set { titleLabel.font = newValue }
  }

  var titleColor: UIColor? {
    get { return titleLabel.textColor }
    set { titleLabel.textColor = newValue }
  }

  var titleAlignmnent: NSTextAlignment? {
    get { return titleLabel.textAlignment }
    set { titleLabel.textAlignment = newValue ?? .left }
  }

  var titleNumberOfLines: Int {
    get { return titleLabel.numberOfLines }
    set { titleLabel.numberOfLines = newValue }
  }

  var subtitle: String? {
    get { return subtitleLabel.text }
    set { subtitleLabel.text = newValue }
  }

  var attributedSubtitle: NSAttributedString? {
    get { return subtitleLabel.attributedText }
    set { subtitleLabel.attributedText = newValue }
  }

  var subtitleFont: UIFont? {
    get { return subtitleLabel.font }
    set { subtitleLabel.font = newValue }
  }

  var subtitleColor: UIColor? {
    get { return subtitleLabel.textColor }
    set { subtitleLabel.textColor = newValue }
  }

  var subtitleAlignmnent: NSTextAlignment? {
    get { return subtitleLabel.textAlignment }
    set { subtitleLabel.textAlignment = newValue ?? .left }
  }

  var subtitleNumberOfLines: Int {
    get { return subtitleLabel.numberOfLines }
    set { subtitleLabel.numberOfLines = newValue }
  }
}

// MARK: - Private Methods
private extension InfoView {
  func setupViews() {
    setupStackView()
    setupTitleLabel()
    setupSubtitleLabel()
  }

  func setupStackView() {
    addSubview(stackView)
    stackView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = .fill
    stackView.spacing = 4
  }

  func setupTitleLabel() {
    stackView.addArrangedSubview(titleLabel)
    titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
    titleLabel.textColor = Colors.Text.labelPrimary.color
    titleLabel.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
    titleLabel.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
  }

  func setupSubtitleLabel() {
    stackView.addArrangedSubview(subtitleLabel)
    subtitleLabel.font = .systemFont(ofSize: 16, weight: .regular)
    subtitleLabel.textColor = Colors.Text.labelSecondary.color
    subtitleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
    subtitleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
  }
}
