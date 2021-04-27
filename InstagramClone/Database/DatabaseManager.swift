//
//  DatabaseManager.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 24/04/2021.
//

import Foundation
import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database(url: "https://instagram-d92a8-default-rtdb.europe-west1.firebasedatabase.app/").reference()
    
    public func canCreateNewUser(with email: String, username: String, completion:@escaping (Bool) -> Void) {
        completion(true)
    }
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { (error, data) in
            if error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
