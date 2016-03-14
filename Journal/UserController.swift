//
//  UserController.swift
//  Journal
//
//  Created by Parker Donat on 3/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import Firebase

class UserController {
    
    static let sharedController = UserController()
    
    // current user property, implicityly unwrapped
    
    // Create a user and when you know its been created to do something in completion block
    func createUser(email: String, password: String) {
        
        let ref = FirebaseController.base
        
        ref.createUser(email, password: password) { (error, resultsDictionary) -> Void in
            
            if error != nil {
                print(error.localizedDescription)
            } else {
                print("successfully created user with email: \(email)")
            }
            
        }
    }
    
    // Create a login for user (IF you did a completion in the main part of fuction you could dismiss a the loginVC for example)
    
    func loginUser(email: String, password: String) {
        let ref = FirebaseController.base
        ref.authUser(email, password: password) { (error, authData) -> Void in
            
            if error != nil {
                print(error.localizedDescription)
        
            } else {
                print("Successfully login user with email: \(email)")
            }
        }
    }
    
    
}

