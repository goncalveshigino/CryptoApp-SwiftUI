//
//  DetailsView.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 04/12/23.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailsView(coin: coin)
            }
        }
    }
}

struct DetailsView: View {
    
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        
    }
    
    var body: some View {
        Text(coin.name)
    }
}

#Preview {
    DetailsView(coin: DeveloerPreview.instance.coin)
}
