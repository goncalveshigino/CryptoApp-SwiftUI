//
//  GRIDView.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 30/11/23.
//

import SwiftUI

struct GridView: View {
    
    private var data: [Int] = Array(1...20)
    private let colors: [Color] = [.red, .green, .blue, .brown]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170)),
        GridItem(.adaptive(minimum: 170))
    ]
    
    private let numberColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: numberColumns, spacing: 20) {
                    ForEach(data, id: \.self) { number in
                        ZStack {
                            Rectangle()
                                .frame(width: 170, height: 170)
                                .foregroundStyle(colors[number%4])
                                .cornerRadius(30)
                            Text("\(number)")
                                .foregroundStyle(.white)
                                .font(.system(size: 80, weight: .bold, design: .rounded))
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Grid 🔥")
        }
    }
}

#Preview {
    GridView()
}
