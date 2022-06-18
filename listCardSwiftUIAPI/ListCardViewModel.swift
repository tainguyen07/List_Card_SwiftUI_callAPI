//
//  ListCardViewModel.swift
//  listCardSwiftUIAPI
//
//  Created by Tai Nguyen on 18/06/2022.
//

import Foundation
struct Card: Hashable, Codable {
    let title: String
    let image: String
    let firstName: String
    let lastName: String
    let id: String
}
class ListCardViewModel: ObservableObject {
    @Published var cards: [Card] = []
    func fetch() {
        guard let url = URL(string: "https://dummyapi.io/data/v1/user?page=1&limit=20") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
        request.setValue("62ac5a8d8ff7aa66e8fe3a89", forHTTPHeaderField: "app-id")
        URLSession.shared.dataTask(with: request) { data, response, err in
            print(response)
            guard let data = data, err == nil else {
                return
            }
            //Convert to JSON
            
            do {
                let cards = try JSONDecoder().decode([Card].self, from: data)
                DispatchQueue.main.async {
                    self.cards = cards
                }
            } catch {
                print(error)
            }
        }.resume()
        
    }
}
