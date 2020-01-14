//
//  PeopleViewModel.swift
//  star-wars-app
//
//  Created by Michał Nowak on 07/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class PeopleViewModel {
    private let repository = PeopleRepository()
    
    var peopleObservable: Observable<[Person]> {
        return repository.peopleObservable.map { $0.results }
    }
    
    var loadingObservable: Observable<Bool> {
        return repository.peopleObservable.map { (item) in return false }.startWith(true)
    }
}
