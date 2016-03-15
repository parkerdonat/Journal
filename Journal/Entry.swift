//
//  Entry.swift
//  Journal
//
//  Created by Parker Donat on 3/14/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    private let kTimeStampKey = "timeStamp"
    private let kTitleKey = "title"
    private let kTextKey = "text"

    
    var timeStamp: NSDate
    var title: String
    var text: String
    
    init(timeStamp: NSDate = NSDate(), title: String, text: String) {
        
        self.timeStamp = timeStamp
        self.title = title
        self.text = text
    }
    
    init?(dictionary: [String: AnyObject]) {
        
        // I need to check optional values in the Dictionary and return nil if any properties are missing
        guard let timeStamp = dictionary[kTimeStampKey] as? NSDate,
            let title = dictionary[kTitleKey] as? String,
            let text = dictionary[kTextKey] as? String else {
                self.timeStamp = NSDate()
                self.title = ""
                self.text = ""
                return nil
        }
        
        self.timeStamp = timeStamp
        self.title = title
        self.text = text
        
    }
    
    
    // returns dictionary with keys and values matching the properties I set
    func dictionaryCopy() -> [String: AnyObject] {
        let dictionary = [
            
            kTimeStampKey : self.timeStamp,
            kTitleKey : self.title,
            kTextKey : self.text
        ]
        return dictionary
    }

}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}
