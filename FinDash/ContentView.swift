//
//  ContentView.swift
//  FinDash
//
//  Created by Deja Jackson on 3/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                NetWorthView()
                    .navigationTitle("Net Worth")
            }
            .tabItem {
                Label("Net Worth", systemImage: "dollarsign")
            }
            NavigationStack {
                AccountsView()
                    .navigationTitle("Accounts")
            }
            .tabItem {
                Label("Accounts", systemImage: "list.dash.header.rectangle")
            }
        }
    }
}

#Preview {
    ContentView()
}
