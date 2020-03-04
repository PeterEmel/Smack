//
//  Rounded Button.swift
//  Smack
//
//  Created by Peter Emel on 3/4/20.
//  Copyright © 2020 Peter Emel. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius : CGFloat = 3 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
  
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
}
