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
    func update(note: Note, title: String, description: String)
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
    
    func update(note: Note, title: String, description: String) {
        note.title = title
        note.desc = description

        saveContext()
    }

    
    func delete(record: Note) {
        context.delete(record)
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
}
