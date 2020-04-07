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
        //For now the rootviewcontroller is a simple MenulistController that we instantiate
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        
        //THis makes the menu on the left side
        menu?.leftSide = true
        
        //When swiping the menu this will hide the top left hand corner that shows the highlighted elements
        menu?.setNavigationBarHidden(true, animated: false)
        
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
    var items = ["Home", "Music", "Photos", "Work", "About", "Terms", "Settings"]
    
    //Create the dark color elements with color literal
    let darkColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    let fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    let backColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
    
    //Override View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        //Create a dark background
        tableView.backgroundColor = darkColor
        //register a simple cell as this
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    //Implement the number of rows, which will be equivilent to the number of items in the array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
        
        //
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        //Change the font color
        cell.textLabel?.textColor = fontColor
        cell.backgroundColor = backColor
        return cell
    }
    
    //Use this to deselect the menu option
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Do something
        
    }
    
}
