//
//  PunInfoHelpViewController.swift
//  emojis
//
//  Created by Katherine Owens on 10/27/16.
//  Copyright © 2016 Katherine Owens. All rights reserved.
//

import Foundation
import UIKit

class PunInfoHelpViewController: UIViewController {
    
    @IBOutlet weak var punHelpInfoText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHelpText()
    }
    
    func setHelpText() {
        punHelpInfoText.text = "You can add information about each pun word; you can add how you used the pun word in the 'usage' box, and you can rate the pun word using the rating slider.  If you come up with more uses for a word later or want to change your rating, you can always come back to this screen and add, remove or make changes to the uses and rating."

    }
    
    @IBAction func dismissPunInfoHelp(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
