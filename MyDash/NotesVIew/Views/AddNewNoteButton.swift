//
//  AddNewNoteButton.swift
//  MyDash
//
//  Created by Abhishek on 11/01/26.
//

import SwiftUI

struct AddNewNoteButton: View {
    
    @State private var showNotesEditor = false
    @ObservedObject var viewModel: NotesViewModel
    
    var body: some View {
        Button {
            showNotesEditor = true
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 28, weight: .regular))
                .foregroundColor(.white)
                .frame(width: 61, height: 61)
                .background(
                    Circle()
                        .fill(Color.black)
                )
                .shadow(color: .black.opacity(0.2), radius: 15, x: 0, y: 16)
        }
        .navigationDestination(isPresented: $showNotesEditor) {
            NotesEditorView(viewModel:viewModel)
        }
    }
}

