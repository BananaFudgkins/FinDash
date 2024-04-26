//
//  Institution.swift
//  FinDash
//
//  Created by Deja Jackson on 4/21/24.
//

import Foundation

class Institution: Identifiable {
    var id: String
    var name: String
    var logo: Data?
    var primary_color: String?
    
    var identifer: String {
        return UUID().uuidString
    }
    
    init(id: String, name: String, logo: Data? = nil, primary_color: String? = nil) {
        self.id = id
        self.name = name
        self.logo = logo
        self.primary_color = primary_color
    }
}
