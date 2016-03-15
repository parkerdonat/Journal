//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Parker Donat on 3/14/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    var entry: Entry?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateWithEntry(entry: Entry) {
        
        self.entry = entry
        
        self.titleTextField.text = entry.title
        self.bodyTextView.text = entry.text
        
    }

    @IBAction func clearButtonPressed(sender: AnyObject) {
        titleTextField.text = ""
        bodyTextView.text = ""
        
    }
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        
        if let entry = self.entry {
            entry.title = self.titleTextField.text!
            entry.text = self.bodyTextView.text
            entry.timeStamp = NSDate()
        } else {
            let newEntry = Entry(title: self.titleTextField.text!, text: self.bodyTextView.text)
            EntryController.sharedController.addEntry(newEntry)
            self.entry = newEntry
        }
        
        self.navigationController?.popViewControllerAnimated(true)
                
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
