//
//  ProfileOrLoginView.swift
//  MyDash
//
//  Created by Abhishek on 09/11/25.
//

import SwiftUI

struct ProfileOrLoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if viewModel.currentUser != nil {
            ProfileView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ProfileOrLoginView()
}
