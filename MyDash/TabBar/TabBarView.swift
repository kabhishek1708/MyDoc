//
//  TabBarView.swift
//  MyDash
//
//  Created by Abhishek on 16/01/25.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab = TabsData.about.rawValue
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack(spacing: 0) {
            TabView (selection: $selectedTab) {
                ProfileOrLoginView()
                    .tag(TabsData.about.rawValue)
                DocumentView()
                    .tag(TabsData.document.rawValue)
                NewsPageView(viewModel: NewsPageVIewModel())
                    .tag(TabsData.news.rawValue)
                NotesGridView()
                    .tag(TabsData.notes.rawValue)
                Text("Stock")
                    .tag(TabsData.stocks.rawValue)
            }
            .padding(.bottom, -50)
            HStack(spacing: 0) {
                ForEach(TabsData.allCases, id: \.rawValue) { tabData in
                    TabItemView(tabData: tabData, tab: tabData.index, selectedTab: $selectedTab)
                }
            }
            .frame(height: appState.hideTabBar ? 0 : 50)
            .opacity(appState.hideTabBar ? 0 : 1)
        }
//        .onAppear {
//            let tabBarAppearance = UITabBarAppearance()
////            tabBarAppearance.configureWithDefaultBackground()
//            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
//        }
        .ignoresSafeArea(.keyboard, edges: .all)
        
    }
}

#Preview {
    TabBarView()
        .environmentObject(AppState())
}
