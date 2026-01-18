//
//  NotesViewModel.swift
//  MyDash
//
//  Created by Abhishek on 12/01/26.
//

import Foundation
import CoreData
	
final class NotesViewModel: ObservableObject {
    
    private let repository: NotesRepository
    
    var context: NSManagedObjectContext = PersistenceController.shared.container.viewContext
    
    init() {
        self.repository = NotesDataRepository(context: context)
    }
    
    func saveNote(title: String, description: String) {
        repository.create(title: title, description: description)
    }
    
    func update(note: Note, title: String, description: String) {
        repository.update(note: note, title: title, description: description)
    }
    
    func deleteNote(note: Note){
        repository.delete(record: note)
    }
}
