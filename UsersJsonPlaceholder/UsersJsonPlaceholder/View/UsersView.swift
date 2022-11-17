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
                Text("**Website**: \(user.website)")
                Divider()
                Text("**Company**: \(user.company.name)")
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
        // user init for model class declaration.
        UsersView(user: .init(id: 1, name: "Stefan", email: "stefanbayne@gmail.com", company: .init(name: "DataCaliper"), phone: "813-210-3055", website: "github.com/getrighhttt"))
    }
}
