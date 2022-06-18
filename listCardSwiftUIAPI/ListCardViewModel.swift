//
//  ListCardViewModel.swift
//  listCardSwiftUIAPI
//
//  Created by Tai Nguyen on 18/06/2022.
//

import Foundation
import Alamofire

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
        let url = "https://dummyapi.io/data/v1/user?page=1&limit=20"
        let headers: HTTPHeaders = ["Content-Type" : "application/json","app-id": "62ac5a8d8ff7aa66e8fe3a89"]
        
        AF.request(url, method: .get , headers: headers).responseJSON { response in
            print(response)
        }
    }
}
