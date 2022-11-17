//
//  UsersView.swift
//  UsersJsonPlaceholder
//
//  Created by Stefan Bayne on 11/17/22.
//

import SwiftUI

struct UsersView: View {
    
    // model declaration
    let user: User
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading){ // ** = bold
                Text("**Name**: \(user.name)")
                Text("**Email**: \(user.email)")
                Text("**Phone**: \(user.phone)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color("blues"), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding(.horizontal, 4)
            .foregroundColor(Color("clear"))
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView(user: .dummy) // .dummy extension
    }
}
