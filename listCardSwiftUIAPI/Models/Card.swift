//
//  Card.swift
//  listCardSwiftUIAPI
//
//  Created by Tai Nguyen on 19/06/2022.
//

import Foundation
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
