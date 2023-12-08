//
//  String.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 08/12/23.
//

import Foundation


extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
