//
//  EntryController.swift
//  Journal
//
//  Created by Parker Donat on 3/14/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class EntryController {
    
    private let kEntriesKey = "entries"
        
    static let sharedController = EntryController()
    
    var entries: [Entry]
    
    init() {
        self.entries = []
        
        loadFromPersistentStorage()
    }
    
    func addEntry(entry: Entry) {
        
        entries.append(entry)
        
        saveToPersistentStorage()
        
    }
    
    func removeEntry(entry: Entry) {
        
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
        }
        
        saveToPersistentStorage()
    }
    
    func loadFromPersistentStorage() {
        
        let entryDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kEntriesKey) as? [[String: AnyObject]]
        
        if let entryDictionaries = entryDictionariesFromDefaults {
            
            self.entries = entryDictionaries.map({Entry(dictionary: $0)!})
        }
    }
    
    func saveToPersistentStorage() {
        let entryDictionaries = self.entries.map({$0.dictionaryCopy()})
        
        NSUserDefaults.standardUserDefaults().setObject(entryDictionaries, forKey: kEntriesKey)
    }
}