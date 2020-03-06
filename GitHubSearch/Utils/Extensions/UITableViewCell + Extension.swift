//
//  UITableViewCell + Extension.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 06/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var key: String {
        return String.init(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: key, bundle: nil)
    }
}
