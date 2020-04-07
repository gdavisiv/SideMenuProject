//
//  ViewController.swift
//  SideMenuProject
//
//  Created by George Davis IV on 4/7/20.
//  Copyright © 2020 3DMations. All rights reserved.
//


//Import SideMenu Library
import SideMenu
import UIKit

class ViewController: UIViewController {
    
    //
    var menu: SideMenuNavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Assign menu to sidemenunavigationcontroller, and it get initialized with the root view controller
        //For now the rootviewcontroller is a simple UIViewController that we initialize
        menu = SideMenuNavigationController(rootViewController: UIViewController())
        
        //THis makes the menu on the left side
        menu?.leftSide = true
        
        //Tell the manager what side the menu is on
        //To make this menu 'swipe to open'
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        
        }
        
        //setup did tap option'
        @IBAction func didTapMenu() {
            present(menu!, animated: true)
    
    }
}
//Create a class that will hold all the items in our menu
//class with a Subclass
class MenuListController: UITableViewController {
    //Create an array of items, itemms in our menu
    var items = ["First", "Second", "Third", "ASDF", "DTGEW", "sadfewr"]
    
    //Override View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        //register a simple cell as this
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    //Implement the number of rows, which will be equivilent to the number of items in the array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
        //
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = items[indexPath.row]
            return cell
        }
        
    }
    
}
