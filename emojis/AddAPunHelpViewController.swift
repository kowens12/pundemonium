//
//  AddAPunHelpViewController.swift
//  emojis
//
//  Created by Katherine Owens on 10/27/16.
//  Copyright © 2016 Katherine Owens. All rights reserved.
//

import Foundation
import UIKit

class AddAPunHelpViewController: UIViewController {
 
    
    @IBOutlet weak var addAPunHelpText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddPunHelpText()
    }
    
    func setAddPunHelpText() {
        addAPunHelpText.text = "Add puns.  You can add the topic of the pun as well as an emoji.  You can also add key words to make puns with.  i.e. if you want to add a cat pun you can add cat related words to make puns with such as, paws, fur, or tails."

    }
    
    @IBAction func dismissAddPunHelp(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
}
