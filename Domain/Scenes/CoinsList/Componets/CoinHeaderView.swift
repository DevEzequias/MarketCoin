//
//  CoinHeaderView.swift
//  MarketCoin
//
//  Created by Ezequias Santos on 13/10/23.
//

import UIKit

class CoinHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "CoinHeaderView"

    @IBOutlet weak var PriceChangePercentualLabel: UILabel!
    
    func setupPriceChangePercentage(from filter: Filter) {
        if filter.type == .priceChangePercentage {
            if let priceChangePercentageFilter = PriceChangePercentageFilterEnum(rawValue: filter.key) {
                PriceChangePercentualLabel.text = priceChangePercentageFilter.title
            }
        }
    }

}
