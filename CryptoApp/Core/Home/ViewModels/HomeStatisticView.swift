//
//  HomeStatisticView.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 25/11/23.
//

import SwiftUI

struct HomeStatisticView: View {
    
   
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortifolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortifolio ? .trailing : .leading)
    }
}

#Preview {
    HomeStatisticView(showPortifolio: .constant(false))
        .environmentObject(DeveloerPreview.instance.homeVM)
}
