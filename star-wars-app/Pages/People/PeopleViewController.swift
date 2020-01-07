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
    let vm = PeopleViewModel()
    
    private var people: [Person] = [Person]()
    
    private let disposeBag = DisposeBag()
    
    private let tableView = UITableView()
    private let progressIndicator = UILabel()
    
    override func loadView() {
        super.loadView()
        view = UIView()
        
        title = "People's Page"
        
        setupProgressView()
        bindViews()
        vm.loadingObservable.subscribe { isLoading in
            if (!(isLoading.element ?? true)) {
                self.setupTableView()
                self.progressIndicator.isHidden = true
            }
        }.disposed(by: disposeBag)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "peopleCellId")
    }
    
    private func setupProgressView() {
        view.addSubview(progressIndicator)
        progressIndicator.text = "Loading.."
        progressIndicator.translatesAutoresizingMaskIntoConstraints = false
        progressIndicator.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        progressIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func bindViews() {
        self.vm.peopleObservable.subscribe { people in
            self.people = people.element?.results ?? self.people
        }.disposed(by: disposeBag)
    }
}

extension PeopleViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCellId", for: indexPath)
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = people[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotImplementedAlert.presentNotImplementedAlert(viewController: self)
    }
}
