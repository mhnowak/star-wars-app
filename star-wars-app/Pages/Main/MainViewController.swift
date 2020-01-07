//
//  ViewController.swift
//  star-wars-app
//
//  Created by Michał Nowak on 02/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    override func loadView() {
        super.loadView()
        view = UIView()
        
        title = "Main Page"
        
        let peopleButton = UIButton()
        peopleButton.setTitle("Click to open People's Page", for: .normal)
        peopleButton.homeButton()
        peopleButton.addTarget(self, action: #selector(navigateToPeoplePage), for: .touchUpInside)
        view.addSubview(peopleButton)
        
        view.addConstraints([
            peopleButton.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            peopleButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
        ])
    }
    
    @objc private func navigateToPeoplePage() {
        self.navigationController?.pushViewController(PeopleViewController(), animated: true)
    }
}
