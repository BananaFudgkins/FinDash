//
//  Account.swift
//  FinDash
//
//  Created by Deja Jackson on 4/21/24.
//

import Foundation
import SwiftData

enum AccountType: Codable {
    case bank
    case creditCard
    case investment
}

@Model
class Account {
    var type: AccountType
    var institution: String
    var balance: Float
    var nickname: String?
    
    init(type: AccountType, institution: String, balance:Float, nickname: String? = nil) {
        self.type = type
        self.institution = institution
        self.balance = balance
        self.nickname = nickname
    }
}
