//
//  EntryController.swift
//  Journal
//
//  Created by Parker Donat on 4/6/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    static let sharedInstance = EntryController()
    
    var entries: [Entry] = []
    
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
