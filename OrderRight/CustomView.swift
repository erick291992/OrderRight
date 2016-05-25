//
//  CustomView.swift
//  OrderRight
//
//  Created by Erick Manrique on 5/20/16.
//  Copyright © 2016 appsathome. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {

    var view: UIView!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        view = loadViewFromNib()
        view.frame = bounds
        //view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        addSubview(view)
    }

    func loadViewFromNib()-> UIView{
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "CustomView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
}
