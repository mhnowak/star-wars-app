//
//  DescriptedImage.swift
//  star-wars-app
//
//  Created by Michał Nowak on 02/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func homeButton() {
        self.backgroundColor = .clear
        self.setTitleColor(.systemYellow, for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: 24)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func listButton() {
        self.backgroundColor = .clear
        self.setTitleColor(.systemYellow, for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: 16)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
