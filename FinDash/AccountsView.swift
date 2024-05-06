//
//  AccountsView.swift
//  FinDash
//
//  Created by Deja Jackson on 3/21/24.
//

import SwiftUI
import SwiftData

struct AccountsView: View {
    @Query var accounts: [Account]
    @State private var showingInstitutionsGrid = false
    
    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 10) {
            if accounts.isEmpty {
                Text("No Accounts!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("No accounts have been added yet! Add some now by pressing the button below.")
                    .font(.title3)
                    .multilineTextAlignment(.center)
            }
            
            Button("Add Account") {
                showingInstitutionsGrid.toggle()
            }
            .sheet(isPresented: $showingInstitutionsGrid) {
                InstitutionGridView()
            }
            .padding()
            .foregroundStyle(.white)
            .background(.tint)
            .clipShape(Capsule())
        }
        .padding()
    }
}

#Preview {
    AccountsView()
}
