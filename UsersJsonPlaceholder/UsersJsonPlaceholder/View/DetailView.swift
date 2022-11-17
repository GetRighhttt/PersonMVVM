//
//  DetailView.swift
//  UsersJsonPlaceholder
//
//  Created by Stefan Bayne on 11/17/22.
//

import SwiftUI

struct DetailView: View {
    
    let user: User
    
    @State var showSheet = false
    var body: some View {
        ZStack {
            Color("blues").ignoresSafeArea()

            ScrollView {
                Button("\(user.name)"){
                    showSheet.toggle() // for our bottom sheet
                }.foregroundColor(Color("clear"))
                    .bold()
                    .font(.title)
                    .padding(.top, 30)
                
                VStack(alignment: .leading) {
                    
                    Spacer()
                    
                    name
                    
                    Divider()
                    
                    contact
                    
                    Divider()
                    
                    company
                    
                    Divider()
                    
                    address
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color("blues"), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                .padding(5)
                .navigationTitle("User Details")
            .foregroundColor(Color("clear"))
            }
            .sheet(isPresented: $showSheet) { // we call the sheet outside of the views total stack
                BottomSheetView(user: user)
                    .presentationDetents([.medium, .large]) // how we control the sheets size
            }
        }
    }
}

/*
 Created a sheet view to use.
 */
struct BottomSheetView: View {
    let user: User
    
    var body: some View {
        ZStack {
            VStack {
                Text("**Info**")
                    .font(.title)
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 85, height: 85)
                        .padding()
                        .font(.title2)
                    
                    Image(systemName: "person")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 85, height: 85)
                        .padding()
                        .font(.title2)

                    Image(systemName: "person.fill")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 85, height: 85)
                        .padding()
                        .font(.title2)

                }
                Text("**\(user.name)**")
                Text("**\(user.phone)**")
                Text("**\(user.email)**")
            }
            .foregroundColor(Color("clear"))
        }
    }
}

private extension DetailView {
    
    var name: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            Text("**Name**")
                .textCase(.uppercase)
            Text(user.name)
            Text(user.username)
        }.foregroundColor(Color("clear"))
    }
    
    var contact: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("**Contact**")
                .textCase(.uppercase)
            Text(user.website)
            Text(user.phone)
            Text(user.email)
        }
        .foregroundColor(Color("clear"))
    }
    
    var company: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("**Company**")
                .textCase(.uppercase)
            Text(user.company.name)
            Text(user.company.catchPhrase)
            Text(user.company.bs)
        }
        .foregroundColor(Color("clear"))
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
        .foregroundColor(Color("clear"))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: .dummy) // built in user model
    }
}
