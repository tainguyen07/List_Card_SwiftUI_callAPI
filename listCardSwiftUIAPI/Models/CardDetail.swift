//
//  CardDetail.swift
//  listCardSwiftUIAPI
//
//  Created by Tai Nguyen on 19/06/2022.
//

import Foundation
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
