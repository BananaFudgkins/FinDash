//
//  Institution.swift
//  FinDash
//
//  Created by Deja Jackson on 4/21/24.
//

import Foundation

class Institution {
    var id: String
    var name: String
    var logo: Data?
    var primary_color: String?
    
    init(id: String, name: String, logo: Data? = nil, primary_color: String? = nil) {
        self.id = id
        self.name = name
        self.logo = logo
        self.primary_color = primary_color
    }
}
