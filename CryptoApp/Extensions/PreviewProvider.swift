//
//  PreviewProvider.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 17/11/23.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloerPreview {
        return DeveloerPreview.instance
    }
    
}

class DeveloerPreview {
    
    static let instance = DeveloerPreview()
    private init(){}
    
    let homeVM = HomeViewModel()
    
    let stat1 = StatisticModel(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
    let stat2 = StatisticModel(title: "Total Volume", value: "$1.23Tr")
    let stat3 = StatisticModel(title: "Portifolio Value", value: "$50.4k", percentageChange: -12.23)
    
    let coin = CoinModel(
        id: "bitcoin",
        symbol: "BTC",
        name: "Bitcoin",
        image: "https://example.com/bitcoin.png",
        currentPrice: 60000,
        marketCap: 1200000000000,
        marketCapRank: 1,
        fullyDilutedValuation: 1300000000000,
        totalVolume: 80000000000,
        high24H: 62000,
        low24H: 58000,
        priceChange24H: 1000,
        priceChangePercentage24H: 1.5,
        marketCapChange24H: 50000000000,
        marketCapChangePercentage24H: 4.2,
        circulatingSupply: 18000000,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 65000,
        athChangePercentage: 5.0,
        athDate: "2021-11-15",
        atl: 50000,
        atlChangePercentage: -10.0,
        atlDate: "2021-01-01",
        lastUpdated: "2023-11-17",
        sparklineIn7D: SparklineIn7D(price: [50000, 55000, 60000, 58000, 62000]),
        priceChangePercentage24HInCurrency: 1.2,
        currentHoldings: 10.0
    )
}



extension CoinModel {
    static func generateMock() -> CoinModel {
        return CoinModel(
            id: "bitcoin",
            symbol: "BTC",
            name: "Bitcoin",
            image: "https://example.com/bitcoin.png",
            currentPrice: 60000,
            marketCap: 1200000000000,
            marketCapRank: 1,
            fullyDilutedValuation: 1300000000000,
            totalVolume: 80000000000,
            high24H: 62000,
            low24H: 58000,
            priceChange24H: 1000,
            priceChangePercentage24H: 1.5,
            marketCapChange24H: 50000000000,
            marketCapChangePercentage24H: 4.2,
            circulatingSupply: 18000000,
            totalSupply: 21000000,
            maxSupply: 21000000,
            ath: 65000,
            athChangePercentage: 5.0,
            athDate: "2021-11-15",
            atl: 50000,
            atlChangePercentage: -10.0,
            atlDate: "2021-01-01",
            lastUpdated: "2023-11-17",
            sparklineIn7D: SparklineIn7D(price: [50000, 55000, 60000, 58000, 62000]),
            priceChangePercentage24HInCurrency: 1.2,
            currentHoldings: 10.0
        )
    }
}
