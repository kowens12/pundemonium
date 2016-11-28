//
//  AddAPunViewController.swift
//  emojis
//
//  Created by Katherine Owens on 9/17/16.
//  Copyright © 2016 Katherine Owens. All rights reserved.
//

import Foundation
import UIKit
import FacebookCore
import FacebookShare
import FBSDKShareKit


class AddAPunViewController: UIViewController, UIPopoverControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var emojiField: UITextField!
    
    @IBOutlet weak var topicsField: UITextField!
    
    @IBOutlet weak var punAddedMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.delegate = self
        self.emojiField.delegate = self
        self.topicsField.delegate = self
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func addNewPun(_ sender: AnyObject) {
        
        let topics = topicsField.text!
            .characters
            .split(separator: ",")
            .map(String.init)
            .map{ Topic(name:$0) }
        
        let punToAdd = Category(name: nameField.text!, emoji: emojiField.text!, topics: topics)
        
        Category.categories.append(punToAdd)
        Category.saveCategories()
        NotificationCenter.default.post(name: categoryDidChange, object: punToAdd)
        
        punAddedMessage.text = "Your pun has been added!"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.becomeFirstResponder()
        if textField == nameField {
            emojiField.becomeFirstResponder()
        }
        
        else if textField == emojiField {
            topicsField.becomeFirstResponder()
        }
        
        else {
        topicsField.endEditing(true)
        }
        return true
    }
    
    @IBAction func done(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func openAddPunHelp(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addAPunHelpSegue", sender: self)
    }
    
    @IBAction func sharePunOnFacebook(_ sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return
        }
        
        let photo = Photo(image: image, userGenerated: true)
        let content = PhotoShareContent(photos: [photo])

        do {
            try ShareDialog.show(from: self, content: content)
        } catch let error {
            let alert = UIAlertController(title: "Error", message: "Please add a photo.", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
