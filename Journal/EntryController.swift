//
//  EntryController.swift
//  Journal
//
//  Created by Caleb Hicks on 10/1/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
import Firebase

public let EntriesUpdateNotification = "EntriesUpdateNotificationName"

class EntryController {
    
    private let entriesKey = "entries"
    
    static let sharedController = EntryController()
    
    var entries: [Entry] {
        didSet {
            let nc = NSNotificationCenter.defaultCenter()
            nc.postNotificationName(EntriesUpdateNotification, object: self)
           
            // NSNotificationCenter.defaultCenter().postNotificationName(EntriesUpdateNotification, object: self)
        }
    }
    
    init() {
        
        self.entries = []
        
        self.loadFromPersistentStorage()
    }
    
    func addEntry(entry: Entry) {
        
        entries.append(entry)
        
        self.saveToPersistentStorage()
    }
    
    func removeEntry(entry: Entry) {
        
        if let entryIndex = entries.indexOf(entry) {
            entries.removeAtIndex(entryIndex)
            
        }
    }
    
    func loadFromPersistentStorage() {
        
        let entriesRef = FirebaseController.entryBase
        entriesRef.observeEventType(.Value, withBlock: { (snap) in
            print("Entries: \(snap.value)")
            if let entryDictionaries = snap.value as? [Dictionary<String, AnyObject>] {
                self.entries = entryDictionaries.map({Entry(dictionary: $0)!})
            }
        })
    }
    
    func saveToPersistentStorage() {
        
        let entryDictionaries = self.entries.map({$0.dictionaryCopy()})
                
        FirebaseController.entryBase.setValue(entryDictionaries)
    }
    
}