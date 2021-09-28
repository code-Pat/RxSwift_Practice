//
//  TimeSeriesMonthlyAdjusted.swift
//  ReactivePractice
//
//  Created by Donggeun Lee on 2021/09/27.
//
// 받아오는 데이터 타입 지정

import Foundation

struct TimeSeriesMonthlyAdjusted: Decodable {
    let meta: Meta
    let series: [String: OHLC]
    
    enum CodingKeys: String, CodingKey {
        case meta = "Meta Data"
        case series = "Monthly Adjusted Time Series"
    }
    
    struct OHLC: Decodable {
        let open: String
        let close: String
        let adjustedClose: String
        
        enum CodingKeys: String, CodingKey {
            case open = "1. open"
            case close = "4. close"
            case adjustedClose = "5. adjusted close"
        }
    }
    
    struct Meta:Decodable {
        let symbol: String
        
        enum CodingKeys: String, CodingKey {
            case symbol = "2. Symbol"
        }
    }
}
