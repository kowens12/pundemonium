//
//  CategoriesTableViewController.swift
//  emojis
//
//  Created by Katherine Owens on 9/12/16.
//  Copyright © 2016 Katherine Owens. All rights reserved.
//

import UIKit


class CategoriesTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTableViewWithNewPun(notification:)), name: categoryDidChange, object: nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Category.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        let category = Category.categories[indexPath.row]
        cell.textLabel?.text = "\(category.emoji) \("") \(category.name)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let deselectedCell = tableView.cellForRow(at: indexPath)!
        deselectedCell.backgroundColor = UIColor.clear
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "fromCategorySegue") {
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                let vc = segue.destination as! TopicsTableViewController
                let selectedCategory = Category.categories[indexPath!.row]
                vc.category = (selectedCategory)
            }
        }
    }
    
    @IBAction func openPunHelp(_ sender: UIBarButtonItem) {
       performSegue(withIdentifier: "categoryToPunHelpSegue", sender: self)
    }
    
    
    func updateTableViewWithNewPun(notification: Notification) {
        tableView.reloadData()
    }
}


