//
//  CircleImage.swift
//  Smack
//
//  Created by Peter Emel on 2/5/20.
//  Copyright © 2020 Peter Emel. All rights reserved.
//

import UIKit


@IBDesignable
class CircleImage: UIImageView {
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
