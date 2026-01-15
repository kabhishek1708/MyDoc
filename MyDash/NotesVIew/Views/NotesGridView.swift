//
//  NotesGridView.swift
//  MyDash
//
//  Created by Abhishek on 12/11/25.
//

import SwiftUI
import CoreData
	
struct NotesGridView: View {
    
    @StateObject var viewModel: NotesViewModel
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Note.date, ascending: false)],
        animation: .default
    )
    private var notes: FetchedResults<Note>
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                ForEach(notes) {note in
                    NoteItemView(note: note)
                }
                AddNewNoteButton(viewModel: viewModel)
            }
            .navigationTitle(Text("Notes"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
