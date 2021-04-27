//
//  StorageManager.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 24/04/2021.
//

import FirebaseStorage
import UIKit

public class StorageManager {
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    public enum storageManagerError: Error {
        case failedToDownload
    }
    
    public func uploadUserPhotoPost(model: UserPost, completion: (Result<URL, Error>) -> Void) {
        
    }
    
    public func downloadImage(with reference: String, completion:@escaping (Result<URL, storageManagerError>) -> Void) {
        bucket.child(reference).downloadURL { (url, error) in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            completion(.success(url))
        }
    }

    
}
