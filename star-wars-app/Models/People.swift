//
//  People.swift
//  star-wars-app
//
//  Created by Michał Nowak on 06/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation

struct People: Decodable {
    let results: [Person]
}

struct Person: Decodable {
    let name: String
    let url: String
}
