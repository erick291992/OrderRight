//
//  CustomButton.swift
//  OrderRight
//
//  Created by Erick Manrique on 5/19/16.
//  Copyright © 2016 appsathome. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var cornerRadius:CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    override func contentRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 0)
    }
}
