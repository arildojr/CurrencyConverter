//
//  CurrencyService.swift
//  SwensonHeConverter
//
//  Created by Arildo Junior on 15/01/20.
//  Copyright © 2020 Arildo Junior. All rights reserved.
//

import Foundation
import Moya

enum CurrencyService {
    case fetchCurrencies
}

struct BaseURL {
  static let baseUrl = "http://data.fixer.io"
  static let key = "78357d78a840a23a2816823fa2b8667e"
}

extension CurrencyService: TargetType {
    
    var baseURL: URL {
        let baseUrl = BaseURL.baseUrl
        guard let url = URL(string: baseUrl) else {
            fatalError("URL cannot be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchCurrencies:
            return "/api/latest"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchCurrencies:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .fetchCurrencies:
            var params: [String: Any] = [:]
            params["access_key"] = BaseURL.key
            
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
