//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by mac-admin on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBAction func saveButton(sender: AnyObject) {
        if let entry = self.entry {
            bodyTextField.text = entry.bodyText
            titleTextField.text = entry.title
        } else {
            let newEntry = Entry(title: titleTextField.text!, bodyText: bodyTextField.text, timeStamp: NSDate())
            EntryController.sharedinstance.addEntry(newEntry)
        }
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateWith(entry: Entry) {
        titleTextField.text = entry.title
        bodyTextField.text = entry.bodyText
    }
}
