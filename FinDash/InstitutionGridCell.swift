//
//  InstitutionGridCell.swift
//  FinDash
//
//  Created by Deja Jackson on 4/24/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct InstitutionGridCell: View {
    let institution: Institution
    
    var body: some View {
        VStack {
            Text(institution.name)
                .font(.title3)
                .fontWeight(.semibold)
        }
        .padding()
    }
}

#Preview {
    InstitutionGridCell(
        institution: Institution(id: "Yo Mama", name: "Yo Mama")
    )
}
