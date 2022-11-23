//
//  TrailRouter.swift
//  Korail-iOS
//
//  Created by sejin on 2022/11/21.
//

import Foundation
import Moya

enum TrailRouter {
    case getTrailLocation
}

extension TrailRouter: TargetType {
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getTrailLocation:
            return "/trail"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTrailLocation:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getTrailLocation:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return APIConstants.baseHeader
    }
}
