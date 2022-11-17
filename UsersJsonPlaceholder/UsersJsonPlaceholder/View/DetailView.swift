//
//  DetailView.swift
//  UsersJsonPlaceholder
//
//  Created by Stefan Bayne on 11/17/22.
//

import SwiftUI

struct DetailView: View {
    
    let user: User
    
    var body: some View {
        
//        ZStack {
//            Color("blues").ignoresSafeArea()
            
            ScrollView {
                Spacer()
                VStack(alignment: .leading) {
                    
                    name
                    
                    Divider()
                    
                    contact
                    
                    Divider()
                    
                    company
                    
                    Divider()
                    
                    address
                }
                .frame(minWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color("blues").ignoresSafeArea())
                .padding()
                .navigationTitle("User Detail")
            }
//        }
    }
}

private extension DetailView {
    
    var name: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            Text("**Name**")
            Text(user.name)
            Text(user.username)
        }
    }
    
    var contact: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("**Contact**")
            Text(user.website)
            Text(user.phone)
            Text(user.email)
        }
    }
    
    var company: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("**Company**")
            Text(user.company.name)
            Text(user.company.catchPhrase)
            Text(user.company.bs)
        }
    }
    
    var address: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("**Address**")
                .textCase(.uppercase)
            Text(user.address.city)
            Text(user.address.street)
            Text(user.address.suite)
            Text(user.address.zipcode)
        }
    }
    
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: .dummy) // built in user model
    }
}
