//
//  AppRootViewController.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import Foundation

import UIKit

final class AppRootViewController: UIViewController {
    
    func set(childViewController controller: UIViewController) {
        addChild(controller)
        controller.didMove(toParent: self)

        let childView = controller.view!
        view.addSubview(childView)
        
        NSLayoutConstraint.activate([childView.topAnchor.constraint(equalTo: view.topAnchor),
                                     childView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     childView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     childView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
}
