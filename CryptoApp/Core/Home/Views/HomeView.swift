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
    @State private var showSettingsView: Bool = false
    @State private var selectedCoins: CoinModel? = nil
    @State private var showDetailsView: Bool = false
    
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
            .sheet(isPresented: $showSettingsView, content: {
                SettingsView()
            })
        }
        .background(
            NavigationLink(
                destination: DetailLoadingView(coin: $selectedCoins),
                isActive: $showDetailsView,
                label: { EmptyView() }
            )
        )
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
                        } else {
                            showSettingsView.toggle()
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
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private func segue(coin: CoinModel) {
        selectedCoins = coin
        showDetailsView.toggle()
    }
    
    
    private var portifolioCoinsList: some View {
        List {
            ForEach(vm.portifolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        HStack {
            HStack(spacing: 4) {
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed ) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
            }
            Spacer()
            if showPortifolio {
                HStack(spacing: 4) {
                    Text("Holdings")
                    Image(systemName: "chevron.down")
                        .opacity((vm.sortOption == .holdings || vm.sortOption == .holdingsReversed ) ? 1.0 : 0.0)
                        .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180))
                }
                .onTapGesture {
                    vm.sortOption = vm.sortOption == .holdings ? .holdingsReversed : .holdings
                }
            }
            HStack(spacing: 4) {
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed ) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            .onTapGesture {
                vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
            }
            
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
