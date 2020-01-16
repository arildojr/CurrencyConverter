//
//  CurrencyDataService.swift
//  SwensonHeConverter
//
//  Created by Arildo Junior on 15/01/20.
//  Copyright © 2020 Arildo Junior. All rights reserved.
//

import Foundation
import Moya

protocol CurrencyFetcher {
    func fetchCurrencies(completion: @escaping ((CurrenciesModel?, Error?) -> Void))
}

final class CurrencyDataService: CurrencyFetcher {
    
    fileprivate let provider = MoyaProvider<CurrencyService>(endpointClosure: { (target: CurrencyService) -> Endpoint in
        let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
        switch target {
        default:
            let httpHeaderFields = ["Content-Type" : "charset=UTF-8"]
            return defaultEndpoint.adding(newHTTPHeaderFields: httpHeaderFields)
        }
    })
    
    func fetchCurrencies(completion: @escaping ((CurrenciesModel?, Error?) -> Void)) {
        provider.request(.fetchCurrencies) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let currencies = try decoder.decode(CurrenciesModel.self, from: response.data) // response from server
                    completion(currencies, nil)
                } catch (let error) {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
