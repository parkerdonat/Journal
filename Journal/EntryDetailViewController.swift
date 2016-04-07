//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Parker Donat on 4/6/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {

    var entry: Entry?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let entry = entry {
            updateWithEntry(entry)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearButtonTapped(sender: AnyObject) {
        titleTextField.text = ""
        bodyTextView.text = ""
        
    }
    
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        if let entry = self.entry {
            entry.title = self.titleTextField.text!
            entry.body = self.bodyTextView.text
            entry.timeStamp = NSDate()
        } else {
            let newEntry = Entry(title: self.titleTextField.text!, body: self.bodyTextView.text)
            EntryController.sharedInstance.addEntry(newEntry)
            self.entry = newEntry
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

    func updateWithEntry(entry: Entry) {
        self.entry = entry
        
        self.titleTextField.text = entry.title
        self.bodyTextView.text = entry.body
    }

}
