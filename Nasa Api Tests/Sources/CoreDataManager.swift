//
//  CoreDataManager.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 24/10/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation

open class CoreDataManager {
    
    open func saveUser(in entityName: String, signedUser: SignedUserable, completion: @escaping (_ sucess: Bool?, _ error: NSError?)->Void?){
        
        let entityObject = EntitySignedUser.signedUserToEntityObject(signedUser)
        CoreDataHelper().saveData(in: entityName, values: entityObject, completion: completion)
    }
    
    open func fetchUser(from entity: String, completion: @escaping (_ sucess: Bool?, _ error: NSError?)->Void?) -> [SignedUserable] {
        
        let fetchedObject = CoreDataHelper().fetchData(from: entity, completion: completion)
        
    }
}
