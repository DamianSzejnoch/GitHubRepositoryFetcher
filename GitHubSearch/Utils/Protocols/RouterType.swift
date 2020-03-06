//
//  RouterType.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import UIKit

protocol RouterType {
    
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    func present(_ module: Presentable?, animated: Bool, modalPresentationSytle: UIModalPresentationStyle)
    func present(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, transition: UIViewControllerAnimatedTransitioning?)
    func push(_ module: Presentable?, transition: UIViewControllerAnimatedTransitioning?, animated: Bool)
    func push(_ module: Presentable?, transition: UIViewControllerAnimatedTransitioning?, animated: Bool, completion: (() -> Void)?)
    
    func popModule()
    func popModule(transition: UIViewControllerAnimatedTransitioning?)
    func popModule(transition: UIViewControllerAnimatedTransitioning?, animated: Bool)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    
    func setRootModule(_ module: Presentable?, animated: Bool)
    func setRootModule(_ module: Presentable?, hideBar: Bool, animated: Bool)
    
    func popToRootModule(animated: Bool)
    func popToModule(module: Presentable?, animated: Bool)
    
    func showTitles()
    func hideTitles()
}
