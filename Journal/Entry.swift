//
//  Entry.swift
//  Journal
//
//  Created by Parker Donat on 4/6/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let titleKey = "title"
    private let bodyKey = "body"
    private let timeStampKey = "timestamp"
    
    var title: String
    var body: String
    var timeStamp = NSDate()
    
    var dictionaryCopy: [String: AnyObject] {
        return [titleKey: title,
                bodyKey: body,
                timeStampKey: timeStamp]
    }
    
    init(title: String, body: String, timeStamp: NSDate = NSDate()) {
        
        self.title = title
        self.body = body
        self.timeStamp = timeStamp
        
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let titleDictionary = dictionary[titleKey] as? String,
            bodyDictionary = dictionary[bodyKey] as? String,
            timeStampDictionary = dictionary[timeStampKey] as? NSDate else { return nil }
        
        self.title = titleDictionary
        self.body = bodyDictionary
        self.timeStamp = timeStampDictionary
    }
}


func ==(lhs: Entry, rhs: Entry) -> Bool {
    
    return (ObjectIdentifier(lhs) == ObjectIdentifier(rhs))
}