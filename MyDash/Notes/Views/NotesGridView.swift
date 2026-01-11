//
//  NotesGridView.swift
//  MyDash
//
//  Created by Abhishek on 12/11/25.
//

import SwiftUI

struct NotesGridView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NoteItemView()
                NoteItemView()
                NoteItemView()
            }
            .navigationTitle(Text("Notes"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NotesGridView()
}
