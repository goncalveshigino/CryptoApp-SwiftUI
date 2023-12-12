//
//  Color.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 17/11/23.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    static let launch = LAunchTheme()
    
}


struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
    
}

//struct ColorTheme2 {
//    
//    let accent = Color()
//    let background = Color("BackgroundColor")
//    let green = Color("GreenColor")
//    let red = Color("RedColor")
//    let secondaryText = Color("SecondaryTextColor")
//    
//}

struct LAunchTheme {
    
    let accent = Color("LaunchAccentColor")
    let backgroun = Color("LaunchBackgroundColor")
    
}
