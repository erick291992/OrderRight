//
//  LoginTextField.swift
//  OrderRight
//
//  Created by Erick Manrique on 5/19/16.
//  Copyright © 2016 appsathome. All rights reserved.
//

import UIKit

@IBDesignable class LoginTextField: UITextField {
    
    struct Colors {
        static let textColor = UIColor(red: 91.0/255.0, green: 188.0/255.0, blue: 252.0/255, alpha: 1.0)
        static let placeHolderColor = UIColor(red: 164.0/255.0, green: 230.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        static let placeHolderBlue = UIColor(red: 89.0/255.0, green: 203.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override func drawRect(rect: CGRect) {
        // Drawing code
        configureTextField(self)
    }
    
    private func configureTextField(textField: UITextField) {
        let textFieldPaddingViewFrame = CGRectMake(0.0, 0.0, 13.0, 0.0)
        let textFieldPaddingView = UIView(frame: textFieldPaddingViewFrame)
        textField.leftView = textFieldPaddingView
        textField.leftViewMode = .Always
        textField.backgroundColor = UIColor.clearColor()
        textField.textColor = UIColor.blueColor()
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSForegroundColorAttributeName: LoginTextField.Colors.placeHolderBlue])
        //text indicator looks like this |
        textField.tintColor = UIColor.blueColor()
    }

}
