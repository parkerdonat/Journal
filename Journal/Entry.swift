//
//  Entry.swift
//  Journal
//
//  Created by Parker Donat on 3/14/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    var timeStamp: NSDate
    var title: String
    var text: String
    
    init(timeStamp: NSDate = NSDate(), title: String, text: String) {
        
        self.timeStamp = timeStamp
        self.title = title
        self.text = text
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}
