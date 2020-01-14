//
//  Requests.swift
//  star-wars-app
//
//  Created by Michał Nowak on 10/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation

public enum SWRequests {
    case people
}

extension SWRequests: APIRequest {
    var method: RequestType {
        switch self {
        case .people:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .people:
            return "people"
        }
    }
    
    var parameters: [String : String] {
        switch self {
        default:
            return [String : String]()
        }
    }
    
    
}
