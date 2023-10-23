//
//  ListCoinsDataProvider.swift
//  MarketCoin
//
//  Created by Ezequias Santos on 09/10/23.
//

import Foundation

protocol ListCoinsDataProviderDelegate: GenericDataProviderDelegate {}

class ListCoinsDataProvider: DataProviderManager<ListCoinsDataProviderDelegate, [CoinModel]> {
    
    private let coinsStore: CoinsStoreProtocol?
    
    init(coinsStore: CoinsStoreProtocol = CoinsStore()) {
        self.coinsStore = coinsStore
    }
    
    func fetchListCoins(by vsCurrency: String,
                        with cryptocurrency: [String]?,
                        orderBy order: String,
                        total porPage: Int,
                        page: Int,
                        percentagePrice: String) {
        
        coinsStore?.fecthLisCoins(by: vsCurrency,
                                  with: cryptocurrency,
                                  orderBy: order,
                                  total: porPage,
                                  page: page,
                                  percentagePrice: percentagePrice,
                                  completion: { result, error in
            
            if let error {
                self.delegate?.errorData(self.delegate, error: error)
            }
            
            if let result {
                self.delegate?.success(model: result)
            }
        })
        
    }
}
