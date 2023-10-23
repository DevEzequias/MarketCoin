//
//  GenerecDataProvider.swift
//  MarketCoin
//
//  Created by Ezequias Santos on 09/10/23.
//

import Foundation

protocol GenericDataProviderDelegate {
    func success(model: Any)
    func errorData(_ provider: GenericDataProviderDelegate?, error: Error)
}

class DataProviderManager<T, S> {
    var delegate: T?
    var model: S?
}
