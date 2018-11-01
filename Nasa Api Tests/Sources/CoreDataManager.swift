//
//  CoreDataManager.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 24/10/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation
import CoreData

open class CoreDataManager {
    
    open func saveUser(in entityName: String, signedUser: SignedUserable){
        
        let entityObject = EntitySignedUser.signedUserToEntityObject(signedUser)
        CoreDataHelper().saveData(in: entityName, values: entityObject)
    }
    
    open func fetchUser(from entity: String) -> [SignedUserable]? {
        var signupUsers: [SignedUserable] = []
        
        if let responseData = CoreDataHelper().fetchData(from: entity) {
            for user in responseData {
                if let userEmail = user.value(forKey: "email") as? String, let userPassword = user.value(forKey: "password") as? String {
                    signupUsers.append(SignedUser.init(userName: "", userEmail: userEmail, userPassword: userPassword))
                }
            }
            return signupUsers
        }
        return nil
    }
}
