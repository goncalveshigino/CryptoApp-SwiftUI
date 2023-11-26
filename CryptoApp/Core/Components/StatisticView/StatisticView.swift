//
//  StatisticView.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 25/11/23.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
            
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundStyle((stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red )
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

#Preview {
    Group {
        StatisticView(stat: DeveloerPreview.instance.stat1)
            .previewLayout(.fixed(width: 300, height: 100))
            .preferredColorScheme(.dark)
        
        StatisticView(stat: DeveloerPreview.instance.stat2)
            .previewLayout(.fixed(width: 300, height: 100))
        
        StatisticView(stat: DeveloerPreview.instance.stat3)
            .previewLayout(.fixed(width: 300, height: 100))
            .preferredColorScheme(.dark)
    }
}
