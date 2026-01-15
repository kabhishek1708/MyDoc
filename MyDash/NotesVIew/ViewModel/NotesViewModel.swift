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
    
    init(
        context: NSManagedObjectContext =
        PersistenceController.shared.container.viewContext
    ) {
        self.repository = NotesDataRepository(context: context)
    }
    
    func saveNote(title: String, description: String) {
        repository.create(title: title, description: description)
    }
}
