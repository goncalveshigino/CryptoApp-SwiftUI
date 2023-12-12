//
//  CoinDetailDataService.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 04/12/23.
//

import Foundation
import Combine

class CoinDetailDataService {
    
    @Published  var coinDetails: CoinDetailModel? = nil
    
    var coinDetailSubscription: AnyCancellable?
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?tickers=false&market_data=false&community_data=false&developer_data=false") else { return }
        
        coinDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion:  NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoinsDetail) in
                self?.coinDetails = returnedCoinsDetail
                self?.coinDetailSubscription?.cancel()
            })
    }
}

