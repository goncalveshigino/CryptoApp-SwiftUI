//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 19/11/23.
//

import Foundation
import Combine

class CoinDataService {
    
    
    @Published var allCoins: [CoinModel] = []
    
    var coinsSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
     func getCoins() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        coinsSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (retunedCoins) in
                self?.allCoins = retunedCoins
                self?.coinsSubscription?.cancel()
            })
    }
    
    
}
