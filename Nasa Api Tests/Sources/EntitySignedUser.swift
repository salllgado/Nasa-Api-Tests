//
//  EntitySignedUser.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 24/10/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation
import CoreData

open class EntitySignedUser {
    
    /**
     Generate a dict [String: String], from data inside the object SignedUser
     
     - parameter signedUser: SignedUserable
     
     - return [String: String]
     */
    open class func signedUserToEntityObject(_ signedUser: SignedUserable) -> [String: String] {
        
        let entityObject = [
            "email": signedUser.userEmail,
            "password": signedUser.userPassword,
            "name": signedUser.userName
        ]
        
        return entityObject
    }
    
    open class func signedUserFromEntityObject(entityObject: [NSManagedObject]) -> [SignedUserable]? {
        var signedUsers: [SignedUser] = []
        for object in entityObject {
            if let userEmail = object.value(forKey: "email") as? String {
                if let userPassword = object.value(forKey: "password") as? String {
                    if let userName = object.value(forKey: "name") as? String {
                        let signedUser = SignedUser.init(userName: userName, userEmail: userEmail, userPassword: userPassword)
                        signedUsers.append(signedUser)
                    }
                }
            }
        }
        return signedUsers.isEmpty ? nil : signedUsers
    }
}
