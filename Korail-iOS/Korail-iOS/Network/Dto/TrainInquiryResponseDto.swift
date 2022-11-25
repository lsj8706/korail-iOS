//
//  TrainInquiryResponseDto.swift
//  Korail-iOS
//
//  Created by 몽이 누나 on 2022/11/25.
//

import Foundation

struct TrailInquiryResponseDto: Codable {
    let status: Int
    let message: String
    let data: [TrailInquiryResponseData]
}

struct TrailInquiryResponseData: Codable {
    let id: Int
    let departures, arrivals, startDate, trainName, startTime, lastTime: String
    let trainInformation: [String]
    let normalPrice: Int
    let specialPrice: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case departures = "Departures"
        case arrivals = "Arrivals"
        case startDate = "StartDate"
        case trainName = "trainName"
        case startTime = "StartTime"
        case lastTime = "LastTime"
        case trainInformation = "TrainInformation"
        case normalPrice = "NormalPrice"
        case specialPrice = "SpecialPrice"
        
    }
}
