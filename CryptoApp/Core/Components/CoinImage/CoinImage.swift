//
//  CoinImage.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 22/11/23.
//

import SwiftUI


struct CoinImage: View {
    
    @StateObject var vm: CoinImageViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
}

#Preview {
    CoinImage(coin: .generateMock())
        .padding()
        .previewLayout(.sizeThatFits)
}
