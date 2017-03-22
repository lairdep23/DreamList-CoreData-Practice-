//
//  ItemType+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Evan on 3/22/17.
//  Copyright © 2017 Evan. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
