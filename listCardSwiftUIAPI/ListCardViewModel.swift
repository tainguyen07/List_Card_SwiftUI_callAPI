//
//  ListCardViewModel.swift
//  listCardSwiftUIAPI
//
//  Created by Tai Nguyen on 18/06/2022.
//

import Foundation
struct Card: Hashable, Codable {
    let name: String
    let image: String
}
class CardListViewModel: ObservableObject {
    @Published var courses: [Card] = []
    func fetch() {
        guard let url = URL(string: " https://dummyapi.io/data/v1/user?page=1&limit=20") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, err in
            guard let data = data, err == nil else {
                return
            }
            //Convert to JSON
            
            do {
                let courses = try JSONDecoder().decode([Card].self, from: data)
                DispatchQueue.main.async {
                    self.courses = courses
                }
            } catch {
                print(error)
            }
        }
    }
}
