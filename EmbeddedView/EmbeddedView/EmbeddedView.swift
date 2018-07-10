//
//  EmbeddedView.swift
//  EmbeddedViewExample
//
//  Created by Mike Lee on 11/18/17.
//  Copyright © 2017 stixlee. All rights reserved.
//

import UIKit

open class EmbeddedView: UIView {
    
    open var nibName: String? = nil
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        _setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _setup()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        loadViewFromNib()
    }
    
    open func loadViewFromNib() {
        if let nibName = nibName {
            let view = loadViewFromNib(named: nibName, owner: self)
            addSubview(view)
            let _ = view.constrainToSuperview()
        }
    }
    
    open func setup() { }
    
}

extension EmbeddedView {
    
    fileprivate func _setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    
    fileprivate func loadNib(named name: String, in bundle: Bundle? = nil) -> UINib {
        let bundle = bundle ?? Bundle.main
        return UINib(nibName: name, bundle: bundle)
    }
    
    fileprivate func loadView<T: UIView>(fromNib nib: UINib, owner: AnyObject? = nil) -> T {
        return nib.instantiate(withOwner: owner, options: nil)[0] as! T
    }
    
    fileprivate func loadViewFromNib<T: UIView>(named name: String, in bundle: Bundle? = nil, owner: AnyObject? = nil) -> T {
        let nib = loadNib(named: name, in: bundle)
        let view = loadView(fromNib: nib, owner: owner)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view as! T
    }
    
}


