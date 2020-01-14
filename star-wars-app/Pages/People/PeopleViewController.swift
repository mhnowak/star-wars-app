//
//  PeopleViewController.swift
//  star-wars-app
//
//  Created by Michał Nowak on 03/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class PeopleViewController: UIViewController {
    private let vm = PeopleViewModel()
    private let peopleView = PeopleView(frame: UIScreen.main.bounds)
    
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        view = peopleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "People's Page"
        
        bindViews()
    }
    
    private func bindViews() {
        vm.loadingObservable.subscribe { isLoading in
            if (!(isLoading.element ?? true)) {
                self.peopleView.progressLabel |> View.negateHidden
                self.peopleView.tableView |> View.negateHidden
            }
        }.disposed(by: disposeBag)
        
        vm.peopleObservable.bind(to: peopleView.tableView.rx.items(cellIdentifier: "peopleCellId")) { row, model, cell in
            cell.textLabel?.text = model.name
        }.disposed(by: disposeBag)
    }
}

