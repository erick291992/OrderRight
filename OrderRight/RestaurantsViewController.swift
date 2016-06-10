//
//  RestaurantsViewController.swift
//  OrderRight
//
//  Created by Erick Manrique on 5/19/16.
//  Copyright © 2016 appsathome. All rights reserved.
//

import UIKit

class RestaurantsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedCells = [NSIndexPath:Bool]()
    let sections = ["Appetizers", "MainDish", "Desserts", "Drinks"]
    let items = [["1","2","3"],["4","5","6"],["7","8","9"],["a","b","c"]]
    var restaurant:Restaurant!
    var menuDic = [String:[MenuItem]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255.0/255.0, green: 0, blue: 0, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
//        tableView.registerNib(UINib(nibName: "MyCustomTableViewCell",bundle: nil), forCellReuseIdentifier: "MyCustomTableViewCell")

        // Do any additional setup after loading the view.
        print(restaurant.restaurantKey)
        FirebaseDataService.sharedInstance().getMenuItems(restaurant.restaurantKey) { (menuDictionary) in
            self.menuDic = menuDictionary
            //print(menuDictionary["Dessert"]!.count)
            //print(self.menuDic["Appetizers"]!.count)
            dispatch_async(dispatch_get_main_queue()) {
                self.menuDic = menuDictionary
                self.tableView.reloadData()
                //print(self.menuDic["Drinks"]![0].name)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items[section].count
        let sect = sections[section]
        print(sect)
//        if let menuDic = menuDic{
//            if let menuItems = menuDic[sect]{
//                print(menuItems.count)
//                return menuItems.count
//            }
//        }
        if let menuItems = menuDic[sect]{
            return menuItems.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("MyCustomTableViewCell", forIndexPath: indexPath) as! MyCustomTableViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuTableViewCell") as! MenuTableViewCell
        
        // Configure the cell...
        
        //cell.textLabel?.text = self.items[indexPath.section][indexPath.row]
//        cell.configure(self.items[indexPath.section][indexPath.row])
//
//        print(selectedCells.count)
        let section = sections[indexPath.section]
        if let menuItems = menuDic[section]{
            let menuItem = menuItems[indexPath.row]
            cell.configure(menuItem.name)
        }
        
        if let selectedCell = selectedCells[indexPath] where selectedCell == true{
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark

        }
        else{
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    // MARK: - Table view delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath){
            if cell.selected
            {
                selectedCells[indexPath] = true
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            }
        }
        
    }
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            selectedCells[indexPath] = false
            cell.accessoryType = .None
        }
    }

}
