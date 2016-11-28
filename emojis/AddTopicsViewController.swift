//
//  AddTopicsViewController.swift
//  emojis
//
//  Created by Katherine Owens on 11/7/16.
//  Copyright © 2016 Katherine Owens. All rights reserved.
//

import Foundation
import UIKit

class AddTopicsViewController: UIViewController, UIPopoverControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var topicsTextView: UITextView!
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topicsTextView.delegate = self
        let textViewBorderColor = UIColor.lightGray.cgColor
        topicsTextView.layer.borderWidth = 1.0
        topicsTextView.layer.cornerRadius = 5.0
        topicsTextView.layer.borderColor = textViewBorderColor
        
    }
    
    
    
    @IBAction func addTopics(_ sender: AnyObject) {
        let topics = topicsTextView.text!
            .characters
            .split(separator: ",")
            .map(String.init)
            .map{ Topic(name:$0) }
        
        category?.topics += topics
        Category.saveCategories()
        NotificationCenter.default.post(name: categoryDidChange, object: topics)
    }
    
    @IBAction func done(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
