//
//  SettingsView.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 08/12/23.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "hhtps://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com/c/swiftfulthinkinh")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com/nicksarno")!
    let coingeckoURL = URL(string: "https://coingecko.com")!
    
    var body: some View {
        ZStack {
            
            Color.theme.background
                .ignoresSafeArea()
            
            List {
                swiftfulthinkingsSection
                    .listRowBackground(Color.theme.background.opacity(0.5))
                coinGeckoSection
                    .listRowBackground(Color.theme.background.opacity(0.5))
                applicationSection
                    .listRowBackground(Color.theme.background.opacity(0.5))
            }
        }
        .font(.headline)
        .accentColor(.blue)
        .listStyle(GroupedListStyle())
        .navigationTitle("Settings")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                XMarkButton()
            }
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}

extension SettingsView {
    
    private var swiftfulthinkingsSection: some View {
        Section(header: Text("Swiftful Thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    Text("This app was made by following a @SwiftfulThinking course on YouTube. It uses MVVM Architecture, Combine, and CoreData")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Subscribe on YouTube 🔥", destination: youtubeURL)
            Link("Support his coffee addiction ☕️", destination: coffeeURL)
        }
    }
    
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayel.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 🔥", destination: coingeckoURL)
            
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website of Service", destination: defaultURL)
            Link("Learn MOre", destination: defaultURL)
        }
    }
    
}


