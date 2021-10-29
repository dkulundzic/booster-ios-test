//
//  BoostRequestContentView.swift
//  BoosterTest
//
//  Created Domagoj Kulundzic on 29.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import UIKit
import Model
import Localization
import System

class BoostRequestContentView: UIView {
  var actionTapHandler: Action?
  var deliveryWindowSelectionHandler: ParametrisedAction<Int>?
  var paymentMethodSelectionHandler: ParametrisedAction<Int>?
  var dateSelectionHandler: ParametrisedAction<Date>?
  private lazy var scrollView = UIScrollView()
  private lazy var contentView = UIView()
  private lazy var actionButton = ActionButton()
  private lazy var stackView = UIStackView()
  private lazy var dateSectionView = SectionView()
  private lazy var datePicker = UIDatePicker()
  private lazy var deliveryWindowSectionView = SectionView()
  private lazy var deliveryWindowSegmentedControl = UISegmentedControl(items: Boost.DeliveryWindow.allCases.map(\.description))
  private lazy var paymentMethodSectionView = SectionView()
  private lazy var paymentMethodSegmentedControl = UISegmentedControl(items: Boost.PaymentMethod.allCases.map(\.description))
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension BoostRequestContentView {
  var isActionButtonEnabled: Bool {
    get { actionButton.isEnabled }
    set { actionButton.isEnabled = newValue }
  }
}

// MARK: - Actions
private extension BoostRequestContentView {
  @objc func deliveryWindowSegmentedControlChangedSelectedSegment(_ sender: UISegmentedControl) {
    deliveryWindowSelectionHandler?(sender.selectedSegmentIndex)
  }
  
  @objc func paymentMethodSegmentedControlChangedSelectedSegment(_ sender: UISegmentedControl) {
    paymentMethodSelectionHandler?(sender.selectedSegmentIndex)
  }
  
  @objc func actionButtonTapped() {
    actionTapHandler?()
  }
  
  @objc func datePickerChanged(_ sender: UIDatePicker) {
    dateSelectionHandler?(sender.date)
  }
}

// MARK: - Private Methods
private extension BoostRequestContentView {
  func setupViews() {
    setupView()
    setupScrollView()
    setupContentView()
    setupStackView()
    setupDateSectionView()
    setupDatePicker()
    setupDeliveryWindowSectionView()
    setupDeliveryWindowSegmentedControl()
    setupPaymentMethodSectionView()
    setupPaymentMethodSegmentedControl()
    setupActionButton()
  }
  
  func setupView() {
    backgroundColor = .white
  }
  
  func setupScrollView() {
    addSubview(scrollView)
    scrollView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    scrollView.alwaysBounceVertical = true
  }
  
  func setupContentView() {
    scrollView.addSubview(contentView)
    contentView.snp.makeConstraints {
      $0.width.equalTo(self)
      $0.edges.equalToSuperview()
    }
  }
  
  func setupStackView() {
    contentView.addSubview(stackView)
    stackView.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(16)
    }
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .fill
    stackView.spacing = 24
  }
  
  func setupDateSectionView() {
    stackView.addArrangedSubview(dateSectionView)
    dateSectionView.title = Localization.BoostRequest.deliveryDateSectionTitle.localized()
    dateSectionView.subtitle = Localization.BoostRequest.deliveryDateSectionSubtitle.localized()
  }
  
  func setupDatePicker() {
    dateSectionView.embedView(datePicker)
    datePicker.date = Date()
    datePicker.minimumDate = Date()
    datePicker.preferredDatePickerStyle = .compact
    datePicker.datePickerMode = .date
    datePicker.tintColor = Colors.General.lightPurple.color
    datePicker.addTarget(self, action: #selector(datePickerChanged(_:)), for: .valueChanged)
  }
  
  func setupDeliveryWindowSectionView() {
    stackView.addArrangedSubview(deliveryWindowSectionView)
    deliveryWindowSectionView.title = Localization.BoostRequest.deliveryWindowSectionTitle.localized()
    deliveryWindowSectionView.subtitle = Localization.BoostRequest.deliveryDateSectionSubtitle.localized()
  }
  
  func setupDeliveryWindowSegmentedControl() {
    deliveryWindowSectionView.embedView(deliveryWindowSegmentedControl)
    deliveryWindowSegmentedControl.selectedSegmentTintColor = Colors.General.purple.color
    deliveryWindowSegmentedControl.apportionsSegmentWidthsByContent = true
    deliveryWindowSegmentedControl.addTarget(self, action: #selector(deliveryWindowSegmentedControlChangedSelectedSegment(_:)), for: .valueChanged)
  }
  
  func setupPaymentMethodSectionView() {
    stackView.addArrangedSubview(paymentMethodSectionView)
    paymentMethodSectionView.title = Localization.BoostRequest.paymentMethodSectionTitle.localized()
    paymentMethodSectionView.subtitle = Localization.BoostRequest.paymentMethodSectionSubtitle.localized()
  }
  
  func setupPaymentMethodSegmentedControl() {
    paymentMethodSectionView.embedView(paymentMethodSegmentedControl)
    paymentMethodSegmentedControl.selectedSegmentTintColor = Colors.General.lightPurple.color
    paymentMethodSegmentedControl.apportionsSegmentWidthsByContent = true
    paymentMethodSegmentedControl.addTarget(self, action: #selector(paymentMethodSegmentedControlChangedSelectedSegment(_:)), for: .valueChanged)
  }
  
  func setupActionButton() {
    addSubview(actionButton)
    actionButton.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16)
      $0.bottom.equalTo(safeAreaLayoutGuide).inset(16)
    }
    actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    actionButton.setTitle(Localization.Actions.orderBoost.localized(), for: .normal)
    actionButton.setContentCompressionResistancePriority(.required, for: .vertical)
  }
}
