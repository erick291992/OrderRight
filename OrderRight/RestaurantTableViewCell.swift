//
//  RestaurantTableViewCell.swift
//  OrderRight
//
//  Created by Erick Manrique on 5/21/16.
//  Copyright © 2016 appsathome. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(likes: String, imageUrlString:String){
        self.likes.text = likes
        
        let imageURL = NSURL(string: imageUrlString)
        if let imageData = NSData(contentsOfURL: imageURL!) {
            self.restaurantImage.image = UIImage(data: imageData)
        }
    }

}
