//
//  ListingSectionView.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

public class SectionView: UIView {
  private lazy var stackView = UIStackView()
  private lazy var titleLabel = UILabel()
  private lazy var subtitleLabel = UILabel()
  private lazy var containerView = UIView()

  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

public extension SectionView {
  var title: String? {
    get { titleLabel.text }
    set { titleLabel.text = newValue }
  }
  
  var subtitle: String? {
    get { subtitleLabel.text }
    set {
      subtitleLabel.text = newValue
      subtitleLabel.isHidden = newValue == nil
      stackView.setCustomSpacing(newValue == nil ? 24 : 6, after: titleLabel)
    }
  }

  func embedView(_ view: UIView, using margins: UIEdgeInsets = .zero) {
    guard !view.isDescendant(of: self) else { return }
    containerView.isHidden = false
    containerView.addSubview(view)
    view.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(margins)
    }
  }
}

// MARK: - Private Methods
private extension SectionView {
  func setupViews() {
    setupView()
    setupStackView()
    setupTitleLabel()
    setupSubtitleLabel()
    setupContainerView()
  }
  
  func setupView() {
    backgroundColor = .white
    layer.cornerRadius = 8
    #warning("TODO: Extract into reusable method on UIView.")
    layer.shadowRadius = 16
    layer.shadowOpacity = 0.25
    layer.shadowColor = UIColor.black.cgColor
  }

  func setupStackView() {
    addSubview(stackView)
    stackView.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(16)
    }
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = 6
  }

  func setupTitleLabel() {
    stackView.addArrangedSubview(titleLabel)
    stackView.setCustomSpacing(24, after: titleLabel)
    titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
    titleLabel.textColor = Colors.Text.labelPrimary.color
    titleLabel.numberOfLines = 0
  }

  func setupSubtitleLabel() {
    stackView.addArrangedSubview(subtitleLabel)
    stackView.setCustomSpacing(24, after: subtitleLabel)
    subtitleLabel.font = .systemFont(ofSize: 12, weight: .medium)
    subtitleLabel.textColor = Colors.Text.labelSecondary.color
    subtitleLabel.isHidden = true
    subtitleLabel.numberOfLines = 0
  }

  func setupContainerView() {
    stackView.addArrangedSubview(containerView)
    containerView.isHidden = true
  }
}
