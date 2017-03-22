//
//  Item+CoreDataClass.swift
//  CoreDataPractice
//
//  Created by Evan on 3/22/17.
//  Copyright © 2017 Evan. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created = NSDate()
    }

}
