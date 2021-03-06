//
//  BoostsCell.swift
//  BoosterTest
//
//  Created by Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit

class BoostsCell: UICollectionViewCell {
  struct ViewModel: Hashable {
    let id: String
    let formattedDate: String?
    let deliveryWindowText: NSAttributedString?
    let paymentMethodIcon: UIImage
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }
  }
  
  private lazy var paymentMethodImageView = UIImageView()
  private lazy var dateLabel = UILabel()
  private lazy var deliveryWindowLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    contentView.dropShadow(shadowPath: UIBezierPath(rect: contentView.bounds).cgPath)
  }
}

extension BoostsCell {
  func update(_ viewModel: ViewModel) {
    paymentMethodImageView.image = viewModel.paymentMethodIcon
    dateLabel.text = viewModel.formattedDate
    deliveryWindowLabel.attributedText = viewModel.deliveryWindowText
  }
}

// MARK: - Private Methods
private extension BoostsCell {
  func setupViews() {
    setupView()
    setupPaymentMethodImageView()
    setupDateLabel()
    setupDeliveryWindowLabel()
  }
  
  func setupView() {
    contentView.backgroundColor = .white
    contentView.layer.cornerRadius = 8
    contentView.dropShadow()
  }
  
  func setupPaymentMethodImageView() {
    contentView.addSubview(paymentMethodImageView)
    paymentMethodImageView.snp.makeConstraints {
      $0.leading.top.equalToSuperview().inset(16)
      $0.size.equalTo(24)
    }
    paymentMethodImageView.tintColor = Colors.General.lightPurple.color
    paymentMethodImageView.setContentHuggingPriority(.required, for: .horizontal)
    paymentMethodImageView.setContentCompressionResistancePriority(.required, for: .horizontal)
  }
  
  func setupDateLabel() {
    contentView.addSubview(dateLabel)
    dateLabel.snp.makeConstraints {
      $0.leading.equalTo(paymentMethodImageView.snp.trailing).offset(8)
      $0.centerY.equalTo(paymentMethodImageView)
      $0.trailing.equalToSuperview().inset(16)
    }
    dateLabel.textColor = .black
    dateLabel.font = .systemFont(ofSize: 16, weight: .semibold)
  }
  
  func setupDeliveryWindowLabel() {
    contentView.addSubview(deliveryWindowLabel)
    deliveryWindowLabel.snp.makeConstraints {
      $0.leading.equalTo(paymentMethodImageView)
      $0.top.equalTo(paymentMethodImageView.snp.bottom).offset(6).priority(999)
      $0.trailing.bottom.equalToSuperview().inset(16)
    }
    deliveryWindowLabel.textColor = Colors.Text.labelSecondary.color
    deliveryWindowLabel.font = .systemFont(ofSize: 16, weight: .regular)
  }
}
