//
//  CurrencyViewModel.swift
//  SwensonHeConverter
//
//  Created by Arildo Junior on 15/01/20.
//  Copyright © 2020 Arildo Junior. All rights reserved.
//

import SwiftUI
import Combine

final class CurrencyViewModel: ObservableObject {
    @Published var baseValue: String = "1.00"
    @Published var convertedValue: String = ""
    private let currency: CurrencyModel
    
    init(currency: CurrencyModel, scheduler: DispatchQueue = DispatchQueue(label: "CurrencyViewModel")) {
        self.currency = currency
        self.convertedValue = String(currency.value)
        _ = $baseValue
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: convert(value:))
    }
    
    func convert(value: String) {
        guard let baseValue = Double(value) else { return }
        convertedValue = String(baseValue * currency.value)
    }
}
