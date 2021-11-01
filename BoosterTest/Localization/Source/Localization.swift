//
//  Localization.swift
//  Localization
//
//  Created by Domagoj Kulundzic on 28.10.2021..
//  Copyright © 2021 Codeopolis. All rights reserved.
//

import Foundation

public struct Localization {
  public enum General: String, LocalizationAsset {
    case morning = "general_morning"
    case afternoon = "general_afternoon"
    case cash = "general_cash"
    case creditCard = "general_credit_card"
  }
  
  public enum Actions: String, LocalizationAsset {
    case next = "action_next"
    case orderBoost = "action_order_boost"
    case cancel = "action_cancel"
    case acknowledgement = "action_acknowledgement"
    case confirmation = "action_confirmation"
    case negation = "action_negation"
  }
  
  public enum Alerts: String, LocalizationAsset {
    case errorTitle = "alerts_error_generic_title"
    case boostOrderedTitle = "alerts_boost_ordered_title"
    case boostOrderedMessage = "alerts_boost_ordered_message"
    case boostCancellationTitle = "alerts_boost_cancelled_title"
    case boostCancellationMessage = "alerts_boost_cancelled_message"
  }
  
  public enum Errors: String, LocalizationAsset {
    case generic = "error_generic"
    case boostExistsForSelectedDate = "error_boost_exists_for_date"
  }
  
  public enum Boosts: String, LocalizationAsset {
    case title = "boosts_title"
    case deliveryWindowDetailFormat = "boosts_delivery_detail_format"
    case emptyMessage = "boosts_empty_message"
  }
  
  public enum BoostDetails: String, LocalizationAsset {
    case title = "boost_details_title"
  }
  
  public enum BoostRequest: String, LocalizationAsset {
    case title = "boosts_request_title"
    case deliveryDateSectionTitle = "boosts_request_delivery_date_section_title"
    case deliveryDateSectionSubtitle = "boosts_request_delivery_date_section_subtitle"
    case deliveryWindowSectionTitle = "boosts_request_delivery_window_section_title"
    case deliveryWindowSectionSubtitle = "boosts_request_delivery_window_section_subtitle"
    case paymentMethodSectionTitle = "boosts_request_payment_method_section_title"
    case paymentMethodSectionSubtitle = "boosts_request_payment_method_section_subtitle"
  }
  
  public enum Map: String, LocalizationAsset {
    case title = "map_title"
    case infoTitle = "map_info_title"
    case infoSubtitle = "map_info_subtitle"
  }
}
