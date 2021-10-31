//
//  BoostDetailsContentView.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import Localization

class BoostDetailsContentView: UIView {
  struct ViewModel {
    let formattedDate: String?
    let deliveryWindow: String?
    let paymentMethod: String?
  }
  
  private lazy var cardContainerView = CardContainerView()
  private lazy var stackView = UIStackView()
  private lazy var dateInfoView = InfoView()
  private lazy var deliveryWindowInfoView = InfoView()
  private lazy var paymentMethodInfoView = InfoView()
  private lazy var decoratorView = UIView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension BoostDetailsContentView {
  func update(_ viewModel: ViewModel) {
    dateInfoView.subtitle = viewModel.formattedDate
    deliveryWindowInfoView.subtitle = viewModel.deliveryWindow
    paymentMethodInfoView.subtitle = viewModel.paymentMethod
  }
}

// MARK: - Private Methods
private extension BoostDetailsContentView {
  func setupViews() {
    setupView()
    setupCardContainerView()
    setupStackView()
    setupDecoratorView()
    setupDateInfoView()
    setupDeliveryWindowInfoView()
    setupPaymentMethodInfoView()
  }
  
  func setupView() {
    backgroundColor = Colors.General.background.color
  }
  
  func setupCardContainerView() {
    addSubview(cardContainerView)
    cardContainerView.snp.makeConstraints {
      $0.leading.top.trailing.equalToSuperview().inset(16)
    }
  }
  
  func setupStackView() {
    cardContainerView.embedView(stackView)
    stackView.axis = .vertical
    stackView.distribution = .fillProportionally
    stackView.alignment = .fill
    stackView.spacing = 16
  }
  
  func setupDateInfoView() {
    stackView.addArrangedSubview(dateInfoView)
    dateInfoView.title = Localization.BoostRequest.deliveryDateSectionTitle.localized()
  }
  
  func setupDeliveryWindowInfoView() {
    stackView.addArrangedSubview(deliveryWindowInfoView)
    deliveryWindowInfoView.title = Localization.BoostRequest.deliveryWindowSectionTitle.localized()
  }
  
  func setupPaymentMethodInfoView() {
    stackView.addArrangedSubview(paymentMethodInfoView)
    paymentMethodInfoView.title = Localization.BoostRequest.paymentMethodSectionTitle.localized()
  }
  
  func setupDecoratorView() {
    addSubview(decoratorView)
    decoratorView.snp.makeConstraints {
      $0.trailing.top.bottom.equalTo(cardContainerView)
      $0.width.equalTo(30)
    }
    decoratorView.backgroundColor = Colors.General.lightPurple.color
    decoratorView.layer.cornerRadius = cardContainerView.layer.cornerRadius
    decoratorView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
  }
}
