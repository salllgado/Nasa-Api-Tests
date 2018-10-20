//
//  CoreDataHelper.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 15/10/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    
    var appDelegate: AppDelegate?
    
    init() {
        if let _appDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.appDelegate = _appDelegate
        }
    }
    
    open func saveData(in entityName: String, values: [String: String]) {
        
        guard let context = appDelegate?.persistenContainer.viewContext else {
            return
        }
        
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: context) else {
            return
        }
        
        let entityObject = NSManagedObject(entity: entity, insertInto: context)
        
        for value in values.enumerated() {
            entityObject.setValue(value.element.value, forKey: value.element.key)
        }
        
        // 4
        do {
            try context.save()
            print(values)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
