//
//  CoordinatorNavigationController.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import UIKit

protocol CoordinatorNavigationControllerDelegate: class {
    func transitionBackFinished()
    func didSelectCustomBackAction()
}

class CoordinatorNavigationController: UINavigationController {
    private var transition: UIViewControllerAnimatedTransitioning?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarAppeatance()
        setNavigationBarHidden(false, animated: false)
    }

    func setTransition(transition: UIViewControllerAnimatedTransitioning?) {
        self.transition = transition
    }
    
    private func setupNavigationBarAppeatance() {
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @objc override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

