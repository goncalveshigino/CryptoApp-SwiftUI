//
//  HomeView.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 17/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortifolio: Bool = false
    
    var body: some View {
        ZStack {
            //background
            Color.theme.background
                .ignoresSafeArea()
            
            //content layer
            VStack {
                homeHeader
                
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
}


extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            withAnimation(.none) {
                CircleButtonView(iconName: showPortifolio ? "plus" : "info")
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
}
