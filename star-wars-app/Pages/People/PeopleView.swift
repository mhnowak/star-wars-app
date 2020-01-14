//
//  PeopleView.swift
//  star-wars-app
//
//  Created by Michał Nowak on 13/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation
import UIKit

class PeopleView: UIView {
    let tableView = UITableView()
    let progressLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PeopleView {
    func setup() {
        setupViewHierarchy()
        applyStyling()
    }
    
    func setupViewHierarchy() {
        setupProgressView()
        setupTableView()
    }
    
    func applyStyling() {
        progressLabel |> Label.setText("Loading..")
        tableView |> View.negateHidden
    }
    
    private func setupTableView() {
        addSubview(tableView)
        
        tableView |> View.notTranslatesAutoresizing
        
        addConstraints([
            tableView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "peopleCellId")
    }
    
    private func setupProgressView() {
        addSubview(progressLabel)
        progressLabel |> View.notTranslatesAutoresizing
        
        addConstraints([
            progressLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            progressLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            progressLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
