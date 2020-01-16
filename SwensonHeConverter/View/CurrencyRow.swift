//
//  CurrencyRow.swift
//  SwensonHeConverter
//
//  Created by Arildo Junior on 15/01/20.
//  Copyright © 2020 Arildo Junior. All rights reserved.
//

import SwiftUI

struct CurrencyRow: View {
    private let currency: CurrencyModel
    private let baseCurrency: String
    @ObservedObject var viewModel: CurrencyViewModel
    
    init(currency: CurrencyModel, baseCurrency: String) {
        self.currency = currency
        self.baseCurrency = baseCurrency
        self.viewModel = CurrencyViewModel(currency: currency)
    }
    
    var body: some View {
        NavigationLink(destination: CurrencyView) {
            HStack {
                Text(currency.name)
                    .padding()
                Spacer()
                Text(String(currency.value))
                    .padding(.trailing)
            }
        }
    }
}

private extension CurrencyRow {
  var CurrencyView: some View {
    VStack {
        HStack {
            TextField("0.00", text: $viewModel.baseValue)
                .keyboardType(.decimalPad)
                .padding()
            Spacer()
            Text(baseCurrency)
                .padding(.trailing)
        }
        HStack {
            TextField(String(currency.value), text: $viewModel.convertedValue)
                .disabled(true)
                .padding()
            Spacer()
            Text(currency.name)
                .padding(.trailing)
        }
        Spacer()
    }.navigationBarTitle(currency.name)
  }
}

struct CurrencyRow_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyRow(currency: CurrencyModel(currency: Dictionary<String, Double>.Element(key: "USD", value: 1.114691)), baseCurrency: "EUR")
    }
}
