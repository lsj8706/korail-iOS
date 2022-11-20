//
//  TrailLocationResponseDto.swift
//  Korail-iOS
//
//  Created by sejin on 2022/11/21.
//

import Foundation

// MARK: - Empty
struct TrailLocationResponseDto: Codable {
    let status: Int
    let message: String
    let data: [TrailLocationResponseData]
}

// MARK: - Datum
struct TrailLocationResponseData: Codable {
    let id: Int
    let departures, arrivals, startDate, lastDate: String
    let personnel: Int
    let content: String

    enum CodingKeys: String, CodingKey {
        case id
        case departures = "Departures"
        case arrivals = "Arrivals"
        case startDate = "StartDate"
        case lastDate = "LastDate"
        case personnel = "Personnel"
        case content
    }
}
