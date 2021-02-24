//
//  User.swift
//  ToDoList
//
//  Created by Альберт on 25.02.2021.
//

import Foundation
import Firebase

struct User {
    var uid: String
    var email: String
    
    init(user:Firebase.User) {
        self.uid = user.uid
        self.email = user.email!
    }
}
