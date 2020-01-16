//
//  CurrencyModel.swift
//  SwensonHeConverter
//
//  Created by Arildo Junior on 15/01/20.
//  Copyright © 2020 Arildo Junior. All rights reserved.
//

import Foundation
import SwiftUI

struct CurrencyModel: Identifiable {
  let currency: Dictionary<String, Double>.Element
  
  var id: String {
    return currency.key
  }
  
  var name: String {
    return currency.key
  }
  
  var value: Double {
    return currency.value
  }
  
  init(currency: Dictionary<String, Double>.Element) {
    self.currency = currency
  }
}
