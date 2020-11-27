//
//  StorageManager.swift
//  Messenger
//
//  Created by Alizée Gillouaye on 25/11/2020.
//

import Foundation
import FirebaseStorage

final class StorageManager {
    
    static let shared = StorageManager()
    
    private let storage = Storage.storage().reference()
    
    /*
     // images/lili-gillouaye-hotmail-fr_profile_picture.png
     */
    
    public typealias UploadPictureCompletion = (Result<String, Error>) -> Void
    
    /// Uploads picture to firebase storage and returns completion with url string to download
    public func uploadProfilPicture(with data: Data, filename: String, completion: @escaping UploadPictureCompletion){
        storage.child("images/\(filename)").putData(data, metadata: nil, completion: { (metadata, error) in
            guard error == nil else {
                // failed
                print("failed to upload data to firebase for picture")
                completion(.failure(StorageErrors.failedToUpload))
                return
            }
            
            self.storage.child("images/\(filename)").downloadURL(completion: { (url, error) in
                guard let url = url else {
                    print("failed to download url")
                    completion(.failure(StorageErrors.failedToGetDownloadUrl))
                    return
                }
                
                let urlString = url.absoluteString
                print("download url returned : \(urlString)")
                completion(.success(urlString))
            })
        })
    }
    
    public enum StorageErrors: Error {
        case failedToUpload
        case failedToGetDownloadUrl
    }
}
