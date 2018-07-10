//
//  UIView+StixExtensions.swift
//  EmbeddedViewExample
//
//  Created by Mike Lee on 11/18/17.
//  Copyright © 2017 stixlee. All rights reserved.
//

import UIKit

extension UIView {
    
    public func constrainToSuperview(active: Bool = true, insets: UIEdgeInsets = UIEdgeInsets.zero, identifier: String? = nil) -> [NSLayoutConstraint] {
        guard let superview = superview else { return [] }
        return constrain(toView: superview, active: active, insets: insets, identifier: identifier)
    }
    
    
    public func constrain(toView view: UIView, active: Bool = true, insets: UIEdgeInsets = UIEdgeInsets.zero, identifier: String? = nil) -> [NSLayoutConstraint] {
        let leadingConstraint = leadingAnchor.constraint(equalTo: view.leadingAnchor)
        leadingConstraint.constant = insets.left
        leadingConstraint.identifier = "leading"
        let trailingConstraint = trailingAnchor.constraint(equalTo: view.trailingAnchor)
        trailingConstraint.constant = -insets.right
        trailingConstraint.identifier = "trailing"
        let topConstraint = topAnchor.constraint(equalTo: view.topAnchor)
        topConstraint.constant = insets.top
        topConstraint.identifier = "top"
        let bottomConstraint = bottomAnchor.constraint(equalTo: view.bottomAnchor)
        bottomConstraint.constant = -insets.bottom
        bottomConstraint.identifier = "bottom"
        
        let constraints = [
            leadingConstraint,
            trailingConstraint,
            topConstraint,
            bottomConstraint
        ]
        if active {
            let _ = NSLayoutConstraint.activate(constraints)
        }
        return constraints
    }
    
}

