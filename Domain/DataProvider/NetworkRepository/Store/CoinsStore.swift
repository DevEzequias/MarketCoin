//
//  CoinsStore.swift
//  MarketCoin
//
//  Created by Ezequias Santos on 09/10/23.
//

import Foundation

protocol CoinsStoreProtocol: GenericStoreProtocol {
    func fecthLisCoins(by vsCurrency: String,
                       with cryptocurrency: [String]?,
                       orderBy order: String,
                       total porPage: Int,
                       page: Int,
                       percentagePrice: String,
                       completion: @escaping completion<[CoinModel]?>)
    func fetchHistorical(by id: String,
                         currency vsCurrency: String,
                         from: String,
                         to: String,
                         completion: @escaping completion<[MarketChartModel]?>)
    func fetchHistorical(by id: String,
                         currency vsCurrency: String,
                         of days: String,
                         completion: @escaping completion<[GraphicDataModel]?>)
    func fetchCoin(by id: String, completion: @escaping completion<[CurrentDataModel]?>)
}

class CoinsStore: GenericStoreRequest, CoinsStoreProtocol {
    func fecthLisCoins(by vsCurrency: String,
                       with cryptocurrency: [String]?,
                       orderBy order: String,
                       total porPage: Int,
                       page: Int,
                       percentagePrice: String,
                       completion: @escaping completion<[CoinModel]?>) {
        do {
            guard let url = try CoinsRouter.coinsMarkets(currency: vsCurrency, 
                                                         cryptocurrency: cryptocurrency,
                                                         order: order,
                                                         parPage: porPage,
                                                         page: page,
                                                         percentage:
                                                            percentagePrice).asURLRequest() else {
                return completion(nil, error)
            }
            request(url: url, completion: completion)
        } catch let error {
            completion(nil, error)
        }
    }
    
    func fetchHistorical(by id: String,
                         currency vsCurrency: String,
                         from: String,
                         to: String,
                         completion: @escaping completion<[MarketChartModel]?>) {
        do {
            guard let url = try CoinsRouter.coinsByIdMarketChart(id: id, currency: vsCurrency, from: from, to: to).asURLRequest() else {
                return completion(nil, error)
            }
            request(url: url, completion: completion)
        } catch let error {
            completion(nil, error)
        }
    }
    
    func fetchHistorical(by id: String,
                         currency vsCurrency: String,
                         of days: String,
                         completion: @escaping completion<[GraphicDataModel]?>) {
        do {
            guard let url = try CoinsRouter.coinsByIdOhlc(id: id, currency: vsCurrency, days: days).asURLRequest() else {
                return completion(nil, error)
            }
            request(url: url, completion: completion)
        } catch let error {
            completion(nil, error)
        }
    }
    
    func fetchCoin(by id: String,
                   completion: @escaping completion<[CurrentDataModel]?>) {
        do {
            guard let url = try CoinsRouter.coinsById(id: id).asURLRequest() else {
                return completion(nil, error)
            }
            request(url: url, completion: completion)
        } catch let error {
            completion(nil, error)
        }
    }
    
}
