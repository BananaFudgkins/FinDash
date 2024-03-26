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
            NetWorthView()
                .tabItem {
                    Label("Net Worth", systemImage: "dollarsign")
                }
            AccountsView()
                .tabItem {
                    Label("Accounts", systemImage: "list.dash.header.rectangle")
                }
        }
    }
}

#Preview {
    ContentView()
}
