//
//  ListCardViewModel.swift
//  listCardSwiftUIAPI
//
//  Created by Tai Nguyen on 18/06/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
struct Card: Hashable {
    let title: String
    let image: String
    let firstName: String
    let lastName: String
    let id: String
    init(js: JSON) {
        title = js["title"].stringValue
        image = js["picture"].stringValue
        firstName = js["firstName"].stringValue
        lastName = js["lastName"].stringValue
        id = js["id"].stringValue
    }
}

class ListCardViewModel: ObservableObject {
    @Published var cards: [Card] = []
    func fetch() {
        let headers: HTTPHeaders = ["Content-Type" : "application/json","app-id": Const.app_id]
        
        AF.request(Const.host + "/user", method: .get , headers: headers).responseJSON{ (responseData) -> Void in
            let json = JSON(responseData.value as Any)
            let data = json["data"].arrayValue
            var tempCards: [Card] = []
            data.forEach { js in
                tempCards.append(Card(js: js))
            }
            self.cards = tempCards
        }
    }
}
