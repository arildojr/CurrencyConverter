//
//  ContentView.swift
//  SwensonHeConverter
//
//  Created by Arildo Junior on 15/01/20.
//  Copyright © 2020 Arildo Junior. All rights reserved.
//

import SwiftUI

struct CurrenciesView: View {
  @ObservedObject var viewModel: CurrenciesViewModel

  init(viewModel: CurrenciesViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    NavigationView {
      List(viewModel.dataSource) { currency in
        if self.viewModel.dataSource.isEmpty {
            self.NoResultsView
        } else {
            CurrencyRow(currency: currency, baseCurrency: self.viewModel.baseCurrency)
        }
      }.navigationBarTitle("Base Currency: " + viewModel.baseCurrency)
    }
  }
}

private extension CurrenciesView {
  var NoResultsView: some View {
    VStack {
      Text("No data found")
    }
  }
}

struct CurrencisView_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesView(viewModel: CurrenciesViewModel())
    }
}
