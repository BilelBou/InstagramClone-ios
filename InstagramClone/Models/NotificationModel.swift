//
//  NotificationModel.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 27/04/2021.
//

import Foundation

enum UserNotificationType {
    case like(post: UserPost)
    case follow(state: UserFollowState)
}

struct UserNotification {
    let type: UserNotificationType
    let text: String
    let user: User
}
