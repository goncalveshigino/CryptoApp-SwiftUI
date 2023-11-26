//
//  Double.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 17/11/23.
//

import Foundation

extension Double {
    
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func asCurrentWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    ///Converte a Double into String representation
    ///```
    ///Convert 1.2345 to "1.23"
    ///```
    
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    ///Converte a Double into String representation with percent symbol
    ///```
    ///Convert 1.2345 to "1.23%"
    ///```
    func asPercentString() -> String {
        return asNumberString()  + "%"
    }
    
    
    ///Conver a Double to a String with K,M,Bn,Tr abbreviations
    ///```
    ///convert 12 to 12.00
    ///convert 1234 to 1.23k
    ///convert 123456 to 123.45K
    ///convert 12345678 to 12.34M
    ///convert 1234567890 to 1.23Bn
    ///convert 123456789012 to 123.45Bn
    ///convert 12345678901234 to 12.34Tr
    ///```
    
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""
        
        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
            
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
            
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
            
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
            
        case 0...:
            return self.asNumberString()
            
        default:
            return "\(sign)\(self)"
        }
    }
}
