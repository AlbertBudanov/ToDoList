//
//  Task.swift
//  ToDoList
//
//  Created by Альберт on 25.02.2021.
//

import Foundation
import Firebase

struct Task {
    let title: String
    let userId: String
    let ref: Firebase.DatabaseReference!
    var completed: Bool = false
    
    init(title: String, userId:String) {
        self.title = title
        self.userId = userId
        self.ref = nil
    }
    
    init(snapshot: Firebase.DataSnapshot) {
        let snapshotValue = snapshot.value as! [String:AnyObject]
        title = snapshotValue["title"] as! String
        userId = snapshotValue["userId"] as! String
        completed = snapshotValue["completed"] as! Bool
        ref = snapshot.ref
    }
    func convertToDictionary() -> Any {
       return ["title": title, "userId": userId, "completed": completed]
    }
}
