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
    
    open func saveData(in entityName: String, values: [String: String]) -> Bool {
        guard let context = appDelegate?.persistenContainer.viewContext else {
            return false
        }
        
        let entityNewObject = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context)
        
        for value in values.enumerated() {
            entityNewObject.setValue(value.element.value, forKey: value.element.key)
        }
        
        // 4
        do {
            try context.save()
            return true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return false
        }
    }
    
    open func fetchData(from entity: String) -> [NSManagedObject]? {
        guard let context = appDelegate?.persistenContainer.viewContext else {
            return nil
        }
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity)
        
        do {
            let response = try context.fetch(fetchRequest)
            return response
        } catch {
            let error = error as NSError
            print("Eror while load data from CoreData \(error)")
            return nil
        }
    }
}
