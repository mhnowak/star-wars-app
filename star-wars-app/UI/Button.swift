//
//  DescriptedImage.swift
//  star-wars-app
//
//  Created by Michał Nowak on 02/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation
import UIKit

class Button: View {
    // Base
    static func baseButtonStyle(_ button: UIButton) {
        button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    }
    
    // Style
    static func titleColorStyle(_ color: UIColor) -> (UIButton) -> Void {
        return {
            $0.setTitleColor(color, for: .normal)
        }
    }

    static func buttonFontStyle(_ font: UIFont) -> (UIButton) -> Void {
        return {
            $0.titleLabel?.font = font
        }
    }
    
    // Mutable
    static func setTitle(_ title: String) -> (UIButton) -> Void {
        return {
            $0.setTitle(title, for: .normal)
        }
    }

    // Ready Styles
    static let homeButtonStyle = baseButtonStyle
        <> notTranslatesAutoresizing
        <> backgroundColorStyle(.clear)
        <> titleColorStyle(.systemYellow)
        <> buttonFontStyle(.boldSystemFont(ofSize: 24))

    static let listButtonStyle = baseButtonStyle
        <> notTranslatesAutoresizing
        <> backgroundColorStyle(.clear)
        <> titleColorStyle(.systemYellow)
        <> buttonFontStyle(.boldSystemFont(ofSize: 16))

}
