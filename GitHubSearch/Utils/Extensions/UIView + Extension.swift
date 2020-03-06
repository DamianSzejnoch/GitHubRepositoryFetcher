//
//  UIView + Extension.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import UIKit

extension UIView {
    struct Static {
        static var key = "key"
    }
    
    var viewIdentifier: String? {
        get {
            return objc_getAssociatedObject( self, &Static.key ) as? String
        }
        set {
            objc_setAssociatedObject(self, &Static.key, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    class func fromNib<T: UIView>() -> T? {
        return Bundle.main.loadNibNamed(String(describing: T.self),
                                        owner: nil,
                                        options: nil)![0] as? T
    }
    
    @discardableResult
    func fromNib<T: UIView>() -> T? {
        guard let view = Bundle.main.loadNibNamed(String(describing: type(of: self)),
                                                  owner: self,
                                                  options: nil)?[0] as? T else {
                                                    return nil
                                                }
        self.addSubview(view)
        view.layoutAttachAll(to: self)
        return view
    }
    
    func convertToImage() -> UIImage {
        let image: UIImage!
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func removeAllSubviews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    // MARK: - Constraints
    public func layoutAttachAll(to parentView: UIView) {
        var constraints = [NSLayoutConstraint]()
        self.translatesAutoresizingMaskIntoConstraints = false
        constraints.append(NSLayoutConstraint(item: self,
                                              attribute: .left,
                                              relatedBy: .equal,
                                              toItem: parentView,
                                              attribute: .left,
                                              multiplier: 1.0,
                                              constant: 0))
        constraints.append(NSLayoutConstraint(item: self,
                                              attribute: .right,
                                              relatedBy: .equal,
                                              toItem: parentView,
                                              attribute: .right,
                                              multiplier: 1.0,
                                              constant: 0))
        constraints.append(NSLayoutConstraint(item: self,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: parentView,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: 0))
        constraints.append(NSLayoutConstraint(item: self,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: parentView,
                                              attribute: .bottom,
                                              multiplier: 1.0,
                                              constant: 0))
        parentView.addConstraints(constraints)
    }
}
