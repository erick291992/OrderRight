//
//  LoginView.swift
//  OrderRight
//
//  Created by Erick Manrique on 5/19/16.
//  Copyright © 2016 appsathome. All rights reserved.
//

import UIKit

@IBDesignable class LoginView: UIView {
    
    // MARK: Colors
    struct Colors {
        static let topGradient = UIColor(red: 91.0/255.0, green: 188.0/255.0, blue: 252.0/255, alpha: 1.0).CGColor
        static let bottomGradient = UIColor(red: 164.0/255.0, green: 230.0/255.0, blue: 253.0/255.0, alpha: 1.0).CGColor
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
        let backgroundGradient = CAGradientLayer()
        backgroundGradient.colors = [Colors.topGradient, Colors.bottomGradient]
        backgroundGradient.locations = [0.0, 1.0]
        backgroundGradient.frame = self.frame
        layer.insertSublayer(backgroundGradient, atIndex: 0)
    }
    
//    let backgroundGradient = CAGradientLayer()
//    
//    @IBInspectable var topColor:UIColor = UIColor.clearColor(){
//        didSet{
//            backgroundGradient.colors = [topColor, bottomColor]
//            backgroundGradient.locations = [0.0, 1.0]
//            backgroundGradient.frame = self.frame
//        }
//    }
//    
//    @IBInspectable var bottomColor:UIColor = UIColor.clearColor(){
//        didSet{
//            backgroundGradient.colors = [topColor, bottomColor]
//            backgroundGradient.locations = [0.0, 1.0]
//            backgroundGradient.frame = self.frame
//        }
//    }
    
    @IBInspectable var topCorners:CGFloat = 0{
        didSet{
            roundCorners([.TopRight, .TopLeft], radius: topCorners)
        }
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
    }


}
