//
//  Notes+CoreDataProperties.swift
//  MyDash
//
//  Created by Abhishek on 12/01/26.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: String(describing: Note.self))
    }

    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?

}

extension Note : Identifiable {

}
