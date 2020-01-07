//
//  People.swift
//  star-wars-app
//
//  Created by Michał Nowak on 06/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation

public struct People: Decodable {
    let results: [Person]
    
    init(results: [Person]) {
        self.results = results
    }
}

public struct Person: Decodable {
    let name: String
    let url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
