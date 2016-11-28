//
//  TopicsTableViewController.swift
//  emojis
//
//  Created by Katherine Owens on 9/12/16.
//  Copyright © 2016 Katherine Owens. All rights reserved.
//

import UIKit

class TopicsTableViewController: UITableViewController, UINavigationBarDelegate, UIPopoverControllerDelegate, UITextFieldDelegate {

    var category: Category?

    @IBOutlet weak var newTopicTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = editButtonItem
        
//            NotificationCenter.default.addObserver(self, selector: #selector(updateTableViewWithNewPun(notification:)), name: categoryDidChange, object: nil)
            //self.newTopicTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 1:
            return 1
        default:
            return category?.topics.count ?? 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "addTopicCell", for: indexPath)
            return cell
        default:
            let topic = category?.topics[(indexPath as NSIndexPath).row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "topicCell", for: indexPath)
            cell.textLabel?.text = topic?.name
        
        return cell
        }
    }
    

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let deselectedCell = tableView.cellForRow(at: indexPath)!
        deselectedCell.backgroundColor = UIColor.clear
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case .some("punWordInfoSegue"):
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                let vc = segue.destination as! PunWordInfoViewController
                let selectedTopic = category?.topics[indexPath!.row]
                vc.topic = selectedTopic
            }
            
        case .some("addTopicsSegue"):
            if let nc = segue.destination as? UINavigationController,
                let vc = nc.topViewController as? AddTopicsViewController {
                vc.category = category
            }
        default:
            break
        }
}
  
    @IBAction func openPunHelp(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "topicToPunHelpSegue", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            category?.topics.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        let newTopic = newTopicTextField.text!
        //category?.topics += newTopic
        Category.saveCategories()
        NotificationCenter.default.post(name: categoryDidChange, object: newTopic)
    }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }

func textFieldDidEndEditing(_ textField: UITextField) -> Bool {
    
    return true
}

func textFieldShouldClear(_ textField: UITextField) -> Bool {
    return true
}

//    func updateTableViewWithNewPun(notification: Notification) {
//        tableView.reloadData()
//    }
//    
//}

