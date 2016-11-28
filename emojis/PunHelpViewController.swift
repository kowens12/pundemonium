//
//  PunHelpViewController.swift
//  emojis
//
//  Created by Katherine Owens on 10/27/16.
//  Copyright © 2016 Katherine Owens. All rights reserved.
//
import Foundation
import UIKit

class PunHelpViewController: UIViewController {

    @IBOutlet weak var punHelpTextLabel: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setPunHelpText()
    }
    
    func setPunHelpText() {
        punHelpTextLabel.text = "This app lets you keep track of all of your puns.  You can add a category of pun (i.e. cat puns), words to use with each category of pun (i.e. for a cat pun you might want to use the words tails, fur, or paws).  You can also add an emoji to accompany each of your categories!"
    }
    
    @IBAction func punHelpDone(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

    
}
