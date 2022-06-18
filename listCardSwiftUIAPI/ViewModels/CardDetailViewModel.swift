//
//  CardDetailViewModel.swift
//  listCardSwiftUIAPI
//
//  Created by Tai Nguyen on 19/06/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
struct CardDetail: Hashable {
    let title: String
    let image: String
    let firstName: String
    let lastName: String
    let id: String
    let email: String
    let dateOfBirth: String
    init(js: JSON) {
        title = js["title"].stringValue
        image = js["picture"].stringValue
        firstName = js["firstName"].stringValue
        lastName = js["lastName"].stringValue
        id = js["id"].stringValue
        email = js["email"].stringValue
        dateOfBirth = js["dateOfBirth"].stringValue
    }
}

class CardDetailViewModel: ObservableObject {
    @Published var cardDetail: CardDetail?
    var card: Card?
    func fetch() {
        let url = Const.host + "/user/" + (card?.id ?? "")
        let headers: HTTPHeaders = ["Content-Type" : "application/json","app-id": "62ac5a8d8ff7aa66e8fe3a89"]
        
        AF.request(url, method: .get , headers: headers).responseJSON{ (responseData) -> Void in
            let json = JSON(responseData.value as Any)
            self.cardDetail = CardDetail(js: json)
        }
    }
}

