//
//  View.swift
//  star-wars-app
//
//  Created by Michał Nowak on 13/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation
import UIKit

class View {
    // Base
    static func notTranslatesAutoresizing<V: UIView>(_ view: V) -> Void {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // Style
    static func backgroundColorStyle(_ color: UIColor) -> (UIView) -> Void {
        return {
            $0.backgroundColor = color
        }
    }
    
    // Mutable
    static func negateHidden<V: UIView>(_ view: V) -> Void {
        view.isHidden = !view.isHidden
    }
}
