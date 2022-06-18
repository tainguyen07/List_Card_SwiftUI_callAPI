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
    @Published var isProgress = false
    @Published var isDelete = false
    var card: Card?
    func fetch() {
        let url = Const.host + "/user/" + (card?.id ?? "")
        AF.request(url, method: .get , headers: Const.headers).responseJSON{ (responseData) -> Void in
            let json = JSON(responseData.value as Any)
            self.cardDetail = CardDetail(js: json)
        }
    }
    func delete() {
        let url = Const.host + "/user/" + (card?.id ?? "")
        self.isProgress = true
        AF.request(url, method: .delete , headers: Const.headers).responseJSON{ (responseData) -> Void in
            self.isProgress = false
            self.isDelete = true
        }
    }
    func edit(firstName: String, lastName: String) {
        let url = Const.host + "/user/" + (card?.id ?? "")
        let params = ["firstName": firstName,"lastName": lastName]
        self.isProgress = true
        AF.request(url, method: .put , parameters: params, headers: Const.headers).responseJSON{ (responseData) -> Void in
            let json = JSON(responseData.value as Any)
            self.cardDetail = CardDetail(js: json)
            self.isProgress = false
        }
    }
}

