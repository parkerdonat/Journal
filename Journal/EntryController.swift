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
    
    let entriesKey = "entries"
    
    var entries: [Entry]
    
    init() {
        self.entries = []
        loadFromPersistentStorage()
    }
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        self.saveToPersistentStorage()
    }
    
    func removeEntry(entry: Entry) {
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
        }
        self.saveToPersistentStorage()
    }
    
    func saveToPersistentStorage() {
        var entryDictionaryArray: [[String: AnyObject]] = []
        
        for entry in entries {
            let entryDictionary = entry.dictionaryCopy
            entryDictionaryArray.append(entryDictionary)
        }
        NSUserDefaults.standardUserDefaults().setObject(entryDictionaryArray, forKey: entriesKey)
    }
    
    func loadFromPersistentStorage() {
        if let entryDictionaryArray = NSUserDefaults.standardUserDefaults().objectForKey(entriesKey) as? [[String: AnyObject]] {
            var entriesArray: [Entry] = []
            for entryDictionary in entryDictionaryArray {
                if let entry = Entry(dictionary: entryDictionary) {
                    entriesArray.append(entry)
                }
            }
            self.entries = entriesArray
        }
    }
}
