//
//  NoteItemView.swift
//  MyDash
//
//  Created by Abhishek on 12/11/25.
//

import SwiftUI

struct NoteItemView: View {
    var note: Note
    var body: some View {
        VStack {
            HStack {
                Text(note.title ?? "")
                    .font(.headline)
                Spacer()
                Image(systemName: "note.text")
            }
            
            Spacer()
            
            Text(note.desc ?? "")
                .multilineTextAlignment(.leading)
                .lineLimit(1)
        }
        .frame(height: 80)
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 3)
        )
    }
}
