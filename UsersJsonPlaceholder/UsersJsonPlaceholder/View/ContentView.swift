//
//  ContentView.swift
//  UsersJsonPlaceholder
//
//  Created by Stefan Bayne on 11/17/22.
//

import SwiftUI

struct ContentView: View {
    
    // necessary observed object for view model
    @StateObject var viewModel = UsersViewModel()
    
    var body: some View {
        
        NavigationView {
            
            // loop through users to load them in.
            // use id for each user
            ZStack {
                
                // if viewmodel is refresing(loading) show progress view
                if viewModel.isRefreshing {
                    ProgressView()
                } else {
                    
                    List {
                        ForEach(viewModel.users, id: \.id) { user in
                            UsersView(user: user)
                                .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                    .navigationBarTitle("Users List")
                    .background(Color("blues"))
                }
            }
            .onAppear(perform: viewModel.fetchUsers) // where we call our viewmodel method.
            .alert(isPresented: $viewModel.hasError, error: viewModel.error) {
                Button(action: viewModel.fetchUsers) {
                    Text("Try Again")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
