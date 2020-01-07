//
//  PeopleRepository.swift
//  star-wars-app
//
//  Created by Michał Nowak on 07/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation

class PeopleRepository {
    private let api = SWApi()
    private lazy var jsonDecoder = JSONDecoder()
    
    private(set) lazy var peopleObservable = api.request(SW.people).map { (response) -> People in
        do {
            return try self.jsonDecoder.decode(People.self, from: response.data)
        } catch {
            return People(results: [])
        }
    }
}
