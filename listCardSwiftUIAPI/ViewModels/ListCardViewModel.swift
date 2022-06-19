//
//  ListCardViewModel.swift
//  listCardSwiftUIAPI
//
//  Created by Tai Nguyen on 18/06/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class ListCardViewModel: ObservableObject {
    @Published var cards: [Card] = []
    func fetch() {
        AF.request(Const.host + "/user", method: .get , headers: Const.headers).responseJSON{ (responseData) -> Void in
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
