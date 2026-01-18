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
    var notes: FetchedResults<Note>
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                List {
                    ForEach(notes) {note in
                        NavigationLink {
                            NotesEditorView(
                                note: note,
                                editing: true,
                                viewModel: viewModel
                            )
                        } label: {
                            NoteItemView(note: note)
                        }
                        .swipeActions {
                                Button {
                                    withAnimation {
                                        viewModel.deleteNote(note: note)
                                    }
                                } label: {
                                    Image(systemName: "trash.fill")
                                }
                            }
                    }
                }
                .listStyle(DefaultListStyle())
                
                AddNewNoteButton(viewModel: viewModel)
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
            }
            .navigationTitle(Text("Notes"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
