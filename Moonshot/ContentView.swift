//
//  ContentView.swift
//  Moonshot
//
//  Created by Professor Foster on 4/14/21.
//

import SwiftUI

struct ContentView: View {
    @State private var text = "Decode JSONss"
    
    var body: some View {
        Button(text) {
            let input = """
            {
                "name": "Taylor Swift",
                "banana": "Yellow"
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            
            struct User: Codable {
                var name: String
                var banana: String
                var address: Address
            }
            
            struct Address: Codable {
                var street: String
                var city: String
            }
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            
            if let user = try? decoder.decode(User.self, from: data) {
                text = user.address.street
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
