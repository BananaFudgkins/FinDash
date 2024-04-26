//
//  InstitutionGridView.swift
//  FinDash
//
//  Created by Deja Jackson on 4/21/24.
//

import SwiftUI

struct InstitutionGridView: View {
    @State private var institutions: [Institution] = [Institution]()
    @State private var fetchingInstitutions = false
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                if fetchingInstitutions {
                    VStack(alignment: .center) {
                        ProgressView()
                        Text("Fetching Institutions...")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                } else {
                    LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                        ForEach(institutions) { instituion in
                            InstitutionGridCell(institution: instituion)
                        }
                    }
                }
            }
            .onAppear {
                if institutions.isEmpty {
                    prepareFetchRequest()
                }
            }
        }
    }
}

extension InstitutionGridView {
    private func prepareFetchRequest() {
        fetchingInstitutions.toggle()
        
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
                
                guard let resp = responseJSON as? [String: Any] else { return }
                
                guard let fetchedInstitutions = resp["institutions"] as? [[String: Any]] else { return }
                
                for institution in fetchedInstitutions {
                    guard let id = institution["instituion_id"] as? String, let name = institution["name"] as? String else { return }
                    
                    institutions.append(Institution(id: id, name: name))
                }
                
                fetchingInstitutions.toggle()
            } catch {
                print("Error getting response JSON: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}

#Preview {
    InstitutionGridView()
}
