//
//  UIViewController + Extension.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 08/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAnAlert(alert: String, message: String, actionTitle: String, actionStyle: UIAlertAction.Style, controller: UIViewController) {
        let alert = UIAlertController(title: alert, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: actionStyle, handler: { action in
        })
        alert.addAction(action)
        controller.present(alert, animated: true, completion: nil)
    }
}
