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
  private lazy var separatorView = UIView()

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
  var isSeparatorHidden: Bool {
    get { separatorView.isHidden }
    set { separatorView.isHidden = newValue }
  }

  var title: String? {
    get { titleLabel.text }
    set { titleLabel.text = newValue }
  }
  
  var subtitle: String? {
    get { subtitleLabel.text }
    set { subtitleLabel.text = newValue }
  }

  var attributedSubtitle: NSAttributedString? {
    get { subtitleLabel.attributedText }
    set {
      subtitleLabel.isHidden = newValue == nil
      subtitleLabel.attributedText = newValue      
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
    setupStackView()
    setupTitleLabel()
    setupSubtitleLabel()
    setupContainerView()
    setupSeparatorView()
  }

  func setupStackView() {
    addSubview(stackView)
    stackView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .fill
  }

  func setupTitleLabel() {
    stackView.addArrangedSubview(titleLabel)
    stackView.setCustomSpacing(6, after: titleLabel)
    titleLabel.font = .systemFont(ofSize: 12, weight: .medium)
    titleLabel.textColor = Colors.Text.title.color
    titleLabel.numberOfLines = 0
  }

  func setupSubtitleLabel() {
    stackView.addArrangedSubview(subtitleLabel)
    stackView.setCustomSpacing(24, after: subtitleLabel)
    subtitleLabel.font = .systemFont(ofSize: 12, weight: .medium)
    subtitleLabel.textColor = .black
    subtitleLabel.isHidden = true
    subtitleLabel.numberOfLines = 0
  }

  func setupContainerView() {
    stackView.addArrangedSubview(containerView)
    stackView.setCustomSpacing(32, after: containerView)
    containerView.isHidden = true
  }

  func setupSeparatorView() {
    stackView.addArrangedSubview(separatorView)
    separatorView.snp.makeConstraints {
      $0.height.equalTo(1)
    }
    separatorView.backgroundColor = .lightGray
    separatorView.layer.cornerRadius = 1
  }
}
