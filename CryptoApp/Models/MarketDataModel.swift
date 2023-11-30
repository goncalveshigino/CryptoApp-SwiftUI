//
//  MarketDataModel.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 26/11/23.
//

import Foundation
// JSON DATA
/*
 URL: https://api.coingecko.com/api/v3/global
 JSON Response:
 {
     "data": {
         "active_cryptocurrencies": 11123,
         "upcoming_icos": 0,
         "ongoing_icos": 49,
         "ended_icos": 3376,
         "markets": 935,
         "total_market_cap": {
             "btc": 39674319.62408292,
             "eth": 717981117.5071349,
             "ltc": 21034271176.040993,
             "bch": 6533851775.573437,
             "bnb": 6409179492.191478,
             "eos": 2140421106491.5044,
             "xrp": 2412938094466.5435,
             "xlm": 12393552187601.598,
             "link": 99149747027.24382,
             "dot": 279552332519.3125,
             "yfi": 172205665.96376237,
             "usd": 1499291845879.5881,
             "aed": 5506449162361.96,
             "ars": 533533206037264.75,
             "aud": 2277866604985.6284,
             "bdt": 164750249717504.56,
             "bhd": 563270452870.3499,
             "bmd": 1499291845879.5881,
             "brl": 7350128345240.106,
             "cad": 2045858688294.9934,
             "chf": 1323555350748.5044,
             "clp": 1301408043991405.5,
             "cny": 10632827841793.457,
             "czk": 33429560358392.6,
             "dkk": 10216624425377.277,
             "eur": 1369259763378.2986,
             "gbp": 1189820017387.8896,
             "hkd": 11688554195069.559,
             "huf": 520551882950207.44,
             "idr": 2.3287900525309308e+16,
             "ils": 5580944476308.184,
             "inr": 124914474679157.6,
             "jpy": 224091641096311.44,
             "krw": 1.95899543704383e+15,
             "kwd": 460720389904.02936,
             "lkr": 491046687513274.75,
             "mmk": 3.138098819174325e+15,
             "mxn": 25663303561328.61,
             "myr": 7023432652022.949,
             "ngn": 1201980882998124.5,
             "nok": 16023666609919.63,
             "nzd": 2467564505785.544,
             "php": 83663104262935.66,
             "pkr": 421400617144527.4,
             "pln": 5988996242958.3125,
             "rub": 133856767004378.4,
             "sar": 5622867674902.675,
             "sek": 15653506446090.424,
             "sgd": 2009650790216.9998,
             "thb": 52835355002208.79,
             "try": 43271961539038.31,
             "twd": 47469079132393.49,
             "uah": 53937950717879.05,
             "vef": 150124092527.92328,
             "vnd": 3.639500905566233e+16,
             "zar": 28170351917875.414,
             "xdr": 1122432846082.9873,
             "xag": 61620520042.689674,
             "xau": 748746347.8322679,
             "bits": 39674319624082.92,
             "sats": 3967431962408292.5
         },
         "total_volume": {
             "btc": 988256.581825471,
             "eth": 17884353.700980052,
             "ltc": 523947408.06106013,
             "bch": 162753188.53767857,
             "bnb": 159647698.49296355,
             "eos": 53316232424.67341,
             "xrp": 60104419583.958824,
             "xlm": 308713788607.98444,
             "link": 2469743426.3378143,
             "dot": 6963432144.383226,
             "yfi": 4289509.799508262,
             "usd": 37346198972.20259,
             "aed": 137161384965.20836,
             "ars": 13289899045142.35,
             "aud": 56739893367.47252,
             "bdt": 4103801153577.497,
             "bhd": 14030630838.065802,
             "bmd": 37346198972.20259,
             "brl": 183086005841.3263,
             "cad": 50960755807.51908,
             "chf": 32968738952.07382,
             "clp": 32417066689517.24,
             "cny": 264855508490.9637,
             "czk": 832704463863.3043,
             "dkk": 254488203656.2801,
             "eur": 34107200481.54246,
             "gbp": 29637495349.95229,
             "hkd": 291152834497.23987,
             "huf": 12966544338542.668,
             "idr": 580083570155634.4,
             "ils": 139017005553.5403,
             "inr": 3111522842398.388,
             "jpy": 5581949264507.899,
             "krw": 48797059477472.54,
             "kwd": 11476188174.566051,
             "lkr": 12231592766218.896,
             "mmk": 78167611741103.7,
             "mxn": 639253020497.2429,
             "myr": 174948269085.28348,
             "ngn": 29940413096088.363,
             "nok": 399137128053.42523,
             "nzd": 61465121192.43047,
             "php": 2083983146458.5063,
             "pkr": 10496763080610.004,
             "pln": 149181259104.41193,
             "rub": 3334268420161.05,
             "sar": 140061279969.2012,
             "sek": 389916724989.1782,
             "sgd": 50058845102.34035,
             "thb": 1316087782443.6067,
             "try": 1077871056256.122,
             "twd": 1182418005658.9023,
             "uah": 1343552587975.9558,
             "vef": 3739474903.0866485,
             "vnd": 906571494751557.8,
             "zar": 701701653839.6068,
             "xdr": 27958933090.94771,
             "xag": 1534919441.2077851,
             "xau": 18650691.76671801,
             "bits": 988256581825.4711,
             "sats": 98825658182547.11
         },
         "market_cap_percentage": {
             "btc": 49.28321322980212,
             "eth": 16.748577351432793,
             "usdt": 5.920651295098856,
             "bnb": 2.400699813031755,
             "xrp": 2.230279804521199,
             "sol": 1.6513213592863771,
             "usdc": 1.6481790653144504,
             "steth": 1.2820435900933924,
             "ada": 0.9202969403786182,
             "doge": 0.7408260460510527
         },
         "market_cap_change_percentage_24h_usd": 0.1736145577894653,
         "updated_at": 1700984559
     }
 }
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}


struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
  

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" +  item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
}

