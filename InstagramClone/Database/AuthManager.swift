//
//  AuthManager.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 24/04/2021.
//

import Foundation
import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    public func registerUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { (canCreate) in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil, result != nil else {
                        completion(false)
                        return
                    }
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { (success) in
                        if success {
                            completion(true)
                        } else {
                            completion(false)
                        }
                    }
                }
            } else {
                completion(false)
            }
        }
    }
    
    public func loginUser(email: String?, username: String?, password: String, completion:@escaping (Bool) -> Void) {
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
            
        }
        else if let username = username {
            print(username)
        }
        
    }
    
    public func logOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch let signOutError as NSError {
            print(signOutError)
            completion(false)
        }
    }
}
