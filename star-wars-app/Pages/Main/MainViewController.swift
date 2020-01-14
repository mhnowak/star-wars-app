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
        view = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        title = "Main Page"
        
        let peopleButton = UIButton()
        peopleButton.addTarget(self, action: #selector(navigateToPeoplePage), for: .touchUpInside)

        peopleButton |> Button.setTitle("Click to open People's Page")
            <> Button.homeButtonStyle
        
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
