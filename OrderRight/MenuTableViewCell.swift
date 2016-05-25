//
//  MenuTableViewCell.swift
//  OrderRight
//
//  Created by Erick Manrique on 5/20/16.
//  Copyright © 2016 appsathome. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var dishLabel: UILabel!
    var wasSelected:Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(dishName: String){
        dishLabel.text = dishName
    }

}
