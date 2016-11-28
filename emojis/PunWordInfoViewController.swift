//
//  PunWordInfoViewController.swift
//  emojis
//
//  Created by Katherine Owens on 10/7/16.
//  Copyright © 2016 Katherine Owens. All rights reserved.
//

import Foundation
import UIKit
import Social

class PunWordInfoViewController: UIViewController, UITextFieldDelegate, UIPopoverControllerDelegate, UITextViewDelegate {
    @IBOutlet weak var punWordUsage: UITextView!
    @IBOutlet weak var punWordRating: UISlider!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var topicNameLabel: UILabel!
    @IBOutlet weak var punInfoSavedLabel: UILabel!
    
    var topic: Topic?
    
    @IBAction func saveInfo(_ sender: AnyObject) {
        topic?.usage = punWordUsage.text
        topic?.rating = punWordRating.value
        Category.saveCategories()
        punInfoSavedLabel.text = "Your pun info has been saved!"
    }
    
    
    
    @IBAction func setRating(_ sender: AnyObject) {
        let rating = punWordRating.value
        
        if rating == 5.0 {
            ratingLabel.text = "This is punbelieveable!"
        } else {
            ratingLabel.text = "Current rating: \(rating)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.punWordUsage.delegate = self
        
        topicNameLabel.text = topic?.name
        punWordUsage.text = topic?.usage
        punWordRating.value = topic?.rating ?? 0.0
    
        if punWordRating.value == 5.0 {
            ratingLabel.text = "This is punbelieveable!"
        } else {
            ratingLabel.text = "Current rating: \(punWordRating.value)"
        }
        
        
    }
    
    @IBAction func openPunInfoHelp(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "punInfoHelpSegue", sender: self)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
