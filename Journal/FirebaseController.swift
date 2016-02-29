//
//  FirebaseController.swift
//  Journal
//
//  Created by Parker Donat on 2/28/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    static let base = Firebase(url: "https://journal-1019.firebaseio.com/")
    static let entryBase = base.childByAppendingPath("entries")
    
}

