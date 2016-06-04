//
//  RestaurantPickerViewController.swift
//  OrderRight
//
//  Created by Erick Manrique on 5/21/16.
//  Copyright © 2016 appsathome. All rights reserved.
//

import UIKit
import Firebase

class RestaurantPickerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let items = [1,2,3,4,5,6,7,8,9]
    var restaurants = [Restaurant]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        FirebaseDataService.sharedInstance().getRestaurant { (FetchedRestaurants) in
            self.restaurants = FetchedRestaurants
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
        return restaurants.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RestaurantTableViewCell") as! RestaurantTableViewCell
        cell.configure(restaurants[indexPath.row].name, imageUrlString: restaurants[indexPath.row].imageUrl)
        return cell
    }
    
    
    // MARK: - Table view delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let controller = self.storyboard!.instantiateViewControllerWithIdentifier("RestaurantsViewController") as! RestaurantsViewController
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    

}
