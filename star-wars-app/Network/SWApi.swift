//
//  SWApi.swift
//  star-wars-app
//
//  Created by Michał Nowak on 02/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation
import Moya
import RxMoya
import RxSwift

class SWApi {
    let provider = MoyaProvider<SW>()
    
    public func request(_ endpoint: SW) -> Observable<Response> {
           return self.provider.rx.request(endpoint).asObservable().flatMap({ (response) -> Observable<Response> in
               return response.catchAPIErrorIfNeeded()
           })
       }
}

extension Response {
    func catchAPIErrorIfNeeded() -> Observable<Response> {
        do {
            let response = try self.filterSuccessfulStatusCodes()
            return Observable.just(response)
        } catch {
            return Observable.just(self)
        }
    }
}
