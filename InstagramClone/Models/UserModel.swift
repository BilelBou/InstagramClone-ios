//
//  UserModel.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 26/04/2021.
//

import Foundation

enum Gender {
    case male, female, other
}

struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
}

struct User {
    let username: String
    let name: (first: String, last:String)
    let birthDate: Date
    let bio: String?
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
    let profilePhoto: URL
}
