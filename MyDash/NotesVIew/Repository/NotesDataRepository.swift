//
//  NotesDataRepository.swift
//  MyDash
//
//  Created by Abhishek on 12/01/26.
//

import CoreData
import SwiftUI

protocol NotesRepository {
    func create(title: String, description: String)
    func getAll() -> [Note]?
    func update(note: Note)
    func delete(record: Note)
}

struct NotesDataRepository: NotesRepository {
    
    let context: NSManagedObjectContext
    
    func create(title: String, description: String) {
        let newNote = Note(context: context)
        newNote.id = UUID()
        newNote.title = title
        newNote.desc = description
        newNote.date = Date()
        
        saveContext()
    }
    
    func getAll() -> [Note]? {
        let result = fetchManagedObjects(managedObject: Note.self)
        return result
    }
    
    func update(note: Note) {
        //
    }
    
    func delete(record: Note) {
        //
    }
    
    private func saveContext() {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func fetchManagedObjects<T: NSManagedObject>(managedObject: T.Type) -> [T]? {
        do {
            guard let result = try context.fetch(managedObject.fetchRequest()) as? [T] else {
                return nil
            }
            return result
        } catch let error{
            debugPrint(error)
        }
        
        return nil
    }
}
