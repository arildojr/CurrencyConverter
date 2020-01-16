//
//  CurrenciesModel.swift
//  SwensonHeConverter
//
//  Created by Arildo Junior on 15/01/20.
//  Copyright © 2020 Arildo Junior. All rights reserved.
//

struct CurrenciesModel: Codable {
  let timestamp: Double
  let base: String
  let date: String
  let rates: [String: Double]
}
