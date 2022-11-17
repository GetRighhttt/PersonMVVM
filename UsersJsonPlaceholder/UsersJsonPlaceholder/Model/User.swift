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
    let email: String
    let company: Company
    let phone: String
    let website: String
}

 /*
  In order to get the company, we have to create it's own object since it is it's own object in JSON response..
  
  "company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
  }
  */
struct Company: Codable {
    let name: String
}















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
