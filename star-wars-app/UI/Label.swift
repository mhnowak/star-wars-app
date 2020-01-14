//
//  Label.swift
//  star-wars-app
//
//  Created by Michał Nowak on 13/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation
import UIKit

class Label: View {
    // Base
    static func baseLabelStyle(_ label: UILabel) {
        label.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    // Mutable
    static func setText(_ text: String) -> (UILabel) -> Void {
        return {
            $0.text = text
        }
    }
}
