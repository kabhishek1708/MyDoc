//
//  NotesEditorView.swift
//  MyDash
//
//  Created by Abhishek on 11/01/26.
//

import SwiftUI

struct NotesEditorView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var context
    
    @ObservedObject var viewModel: NotesViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            
            LabeledTextField(
                label: "Title",
                placeholder: "Notes Title",
                text: $title
            )
            
            LabeledTextEditor(
                label: "Description",
                placeholder: "Write your note...",
                text: $description
            )
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    saveNote()
                    dismiss()
                } label: {
                    Text("Save")
                        .foregroundColor(.black)
                       
                }.disabled(title.isEmpty)
            }
        }
    }
    
    private func saveNote() {
        viewModel.saveNote(title: title, description: description)
    }
}


struct LabeledTextField: View {
    let label: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)

            TextField(placeholder, text: $text)
                .font(.headline)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.15),
                        radius: 6, x: 0, y: 3)
        )
    }
}

struct LabeledTextEditor: View {
    let label: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)

            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.gray.opacity(0.6))
                        .padding(.top, 8)
                        .padding(.leading, 4)
                }

                TextEditor(text: $text)
                    .font(.body)
                    .frame(minHeight: 80)
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.15),
                        radius: 6, x: 0, y: 3)
        )
    }
}
