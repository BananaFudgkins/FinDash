//
//  InstitutionGridView.swift
//  FinDash
//
//  Created by Deja Jackson on 4/21/24.
//

import SwiftUI

struct InstitutionGridView: View {
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                
            }
        }
        .onAppear {
            prepareFetchRequest()
        }
    }
}

extension InstitutionGridView {
    private func prepareFetchRequest() {
        guard let url = URL(string: "https://sandbox.plaid.com/institutions/get") else {
            print("Unable to create URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let json: [String: Any] = ["client_id": client_id,
                                   "secret": secret,
                                   "count": 200,
                                   "offset": 0,
                                   "country_codes": ["US"]]
        
        do {
            let requestBody = try JSONSerialization.data(withJSONObject: json)
            request.httpBody = requestBody
            
            fetchInstitutions(with: request)
        } catch {
            print("Error preparing request body: \(error.localizedDescription)")
        }
    }
    
    private func fetchInstitutions(with request: URLRequest) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error getting response data: \(error?.localizedDescription)")
                return
            }
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: data, options: [])
                
                if let responseJSON = responseJSON as? [String: Any] {
                    print(responseJSON)
                }
            } catch {
                print("Error getting response JSON: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    InstitutionGridView()
}
