//
//  SWApi+Moya.swift
//  star-wars-app
//
//  Created by Michał Nowak on 07/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation
import Moya
import RxMoya
import Alamofire

public enum SW {
    case people
}

extension SW: TargetType {
    public var baseURL: URL {
        return URL(string: "https://swapi.co/api/")!
    }
    
    public var path: String {
        switch self {
            case .people: return "people"
        }
    }
    
    public var method: Moya.Method {
        switch self {
            case .people: return .get
        }
    }
    
    public var sampleData: Data {
        return Data() // TODO when testing
    }
    
    public var task: Task {
        return .requestPlain // TODO
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
      return .successCodes
    }
    
    
}
