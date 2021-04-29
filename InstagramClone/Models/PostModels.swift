//
//  PostModels.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 26/04/2021.
//

import Foundation

public enum UserPostType: String {
    case photo = "Photo"
    case video = "Video"
}
/// Represent an user post
public struct UserPost {
    let id: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createdDate: Date
    let taggedUsers: [User]
    let owner: User
}

struct PostLike {
    let username: String
    let postId: String
}

struct CommentLike {
    let username: String
    let commentId: String
}

struct PostComment {
    let id: String
    let username: String
    let text : String
    let createdDate: Date
    let likes: [CommentLike]
}
