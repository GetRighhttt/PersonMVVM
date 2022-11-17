//
//  User.swift
//  UsersJsonPlaceholder
//
//  Created by Stefan Bayne on 11/17/22.
//

import Foundation

/*
 Used to model data and make sure the name matches json response from url
 https://jsonplaceholder.typicode.com/users
 
 Codable = Decodable and Encodable for free.
 */
struct User: Codable {
    // all constants
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
    
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
}

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}

extension User {
    
    static var dummy: User {
        
        .init(id: 1,
              name: "Stefan",
              username: "GetRight",
              email: "stefanbayne@gmail.com",
              address: .init(
                street: "this street",
                suite: "my room",
                city: "Tampa, FL",
                zipcode: "33617"
              ),
              phone: "813-232-2341",
              website: "github.com",
              company: .init(
                name: "BlackDev",
                catchPhrase: "GetRighhttt",
                bs: ""))
    }
}




;








//-------------------------------------------------------------------------------------------------------------------------
/*
 {
 "id": 1,
 "name": "Leanne Graham",
 "username": "Bret",
 "email": "Sincere@april.biz",
 "address": {
 "street": "Kulas Light",
 "suite": "Apt. 556",
 "city": "Gwenborough",
 "zipcode": "92998-3874",
 "geo": {
 "lat": "-37.3159",
 "lng": "81.1496"
 }
 },
 "phone": "1-770-736-8031 x56442",
 "website": "hildegard.org",
 "company": {
 "name": "Romaguera-Crona",
 "catchPhrase": "Multi-layered client-server neural-net",
 "bs": "harness real-time e-markets"
 }
 */
