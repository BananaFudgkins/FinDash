//
//  InstitutionGridCell.swift
//  FinDash
//
//  Created by Deja Jackson on 4/24/24.
//

import SwiftUI

struct InstitutionGridCell: View {
    let institution: Institution
    
    var body: some View {
        VStack {
            if let logo = institution.logo {
                Image(data: logo)!
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text(institution.name)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .colorInvert()
        }
        .padding()
    }
}

#Preview {
    InstitutionGridCell(
        institution: Institution(id: "Yo Mama", name: "Yo Mama")
    )
}
