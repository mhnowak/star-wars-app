//
//  SWApi.swift
//  star-wars-app
//
//  Created by Michał Nowak on 10/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation
import RxSwift

struct APIResponse {
    let data: Data?
    let response: URLResponse?
}

class SWApi {
    private let baseURL = URL(string: "https://swapi.co/api/")!
    
    func request(apiRequest: APIRequest) -> Observable<APIResponse> {
        return Observable<APIResponse>.create { observer in
            let request = apiRequest.request(with: self.baseURL)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    observer.onError(error!)
                    } else {
                    let response = APIResponse(data: data, response: response)
                    observer.onNext(response)
                }
            
                observer.onCompleted()
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
