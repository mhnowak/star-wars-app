//
//  Alert.swift
//  star-wars-app
//
//  Created by Michał Nowak on 03/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation
import UIKit

struct NotImplementedAlert {
    static func presentNotImplementedAlert(viewController: UIViewController) {
        let alert = UIAlertController(title: "Not implemented yet", message: "Coming Soon", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        viewController.present(alert, animated: true)
    }
}
