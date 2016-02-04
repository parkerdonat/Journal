//
//  Journal.swift
//  Journal
//
//  Created by Kaleo Kim on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    let title: String
    let bodyText: String
    let timeStamp: NSDate
    
    init(title: String, bodyText: String, timeStamp: NSDate = NSDate()) {
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = timeStamp
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
//    return lhs.title == rhs.title && lhs.bodyText == rhs.bodyText && lhs.timeStamp == rhs.timeStamp
    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
}



