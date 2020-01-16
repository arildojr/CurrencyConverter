//
//  CurrenciesViewModel.swift
//  SwensonHeConverter
//
//  Created by Arildo Junior on 15/01/20.
//  Copyright © 2020 Arildo Junior. All rights reserved.
//

import SwiftUI
import Combine

final class CurrenciesViewModel: ObservableObject {
    @Published var baseCurrency = ""
    @Published var dataSource: [CurrencyModel] = []
    private let service: CurrencyFetcher = CurrencyDataService()
    private var currenciesResponse: CurrenciesModel?
    
    init() {
        fetchCurrencies()
    }
    
    func fetchCurrencies() {
        service.fetchCurrencies() { (response, error) in
            if error != nil { return }
            guard let currencies = response else { return }
            self.currenciesResponse = currencies
            self.baseCurrency = currencies.base
            self.dataSource = currencies.rates.map { CurrencyModel(currency: $0) }.sorted { $0.name < $1.name }
        }
    }
}
