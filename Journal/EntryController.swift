//
//  JournalController.swift
//  Journal
//
//  Created by Kaleo Kim on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    static let sharedinstance = EntryController()
    
    var entries: [Entry]
    
    init() {
        entries = []
    }
    
    func addEntry(entry: Entry) {
        entries.append(entry)
    }
    
    func removeEntry(entry: Entry) {
        
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
            
        }
    }
    
}