//
//  HomeView.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 17/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortifolio: Bool = false
    @State private var showPortifolioView: Bool = false
    
    var body: some View {
        ZStack {
            //background
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortifolioView, content: {
                    PortifolioView()
                        .environmentObject(vm)
                })
            
            //content layer
            VStack {
                homeHeader
                HomeStatisticView(showPortifolio: $showPortifolio)
                SearchBarView(searchText: $vm.searchText)
                
                columnTitles
                
                if !showPortifolio {
                    allCoinsList
                       .transition(.move(edge: .leading))
                } else {
                    portifolioCoinsList
                        .transition(.move(edge: .trailing))
                }
           
                
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .navigationBarHidden(true)
    }
    .environmentObject(HomeViewModel())
}


extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            withAnimation(.none) {
                CircleButtonView(iconName: showPortifolio ? "plus" : "info")
                    .onTapGesture {
                        if showPortifolio {
                            showPortifolioView.toggle()
                        }
                    }
                    .background(
                      CircleButtonAnimationView(animate: $showPortifolio)
                    )
            }
            Spacer()
            Text(showPortifolio ? "Portifolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortifolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortifolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portifolioCoinsList: some View {
        List {
            ForEach(vm.portifolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortifolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            
            Button {
                withAnimation(.linear(duration: 2.0)) {
                    vm.reloadData()
                }
            } label: {
                Image(systemName: "goforward")
            }
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)

        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .padding(.horizontal)
    }

}
