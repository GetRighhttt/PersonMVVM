//
//  UsersViewModel.swift
//  UsersJsonPlaceholder
//
//  Created by Stefan Bayne on 11/17/22.
//

import Foundation

/*
 Holds the business logic and must be a class because we have to Observe state changes.
 
 We show how to handle error here, and create a property to handle when the api is loading.
 */
final class UsersViewModel: ObservableObject {
    
    /*
     We need a property for our views to listen to that acts as a source of truth.
     
     We set it to an empty array because when the view first starts, the array is empty.
     */
    @Published var users: [User] = []
    
    /*
     properties for the errors.
     */
    @Published var hasError = false
    @Published var error: UserError?
    @Published private(set) var isRefreshing = false // private(set) so views canot change or mess it up.
    
    func fetchUsers() {
        // set to true, and will tell us when users are loading.
        isRefreshing = true
        
        // set to false by default because we just started process. reset it basically
        hasError = false
        
        // declare the url we are interacting with.
        let usersURLString = "https://jsonplaceholder.typicode.com/users"
        if let url = URL(string: usersURLString) {
            /*
             Execute and safely call the API with URLSession framework.
             URL could be invalid, so we need to safely unwrap the URL.
             Shared is a singleton to create one instance.
             Need to set our method to weak so when the system tries to get rid of it, it will.
             We do this to avoid a retained cycle - view model instance won't be removed.
             */
            URLSession
                .shared
                .dataTask(with: url) { [weak self] data, response, error in
                    
                    // asyncAfter adds a delay!
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        
                        /*
                         Need to handle data that we get back form service so we will use the JSONDecoder() for that.
                         Check for errors first.
                         */
                        if let error = error {
                            // TODO: Handle error
                            
                            self?.hasError = true
                            self?.error = UserError.custom(error: error)
                            
                        } else {
                            
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase // makes this_person -> thisPerson . Snake -> Json
                            
                            /*
                             We are expecting an array of users back from our api, so we have to decode them accordingly.
                             */
                            if let data = data,
                               let users = try? decoder.decode([User].self, from: data) {
                                // TODO: set the data
                                
                                self?.users = users
                                
                            } else {
                                // TODO: Handle error
                                self?.hasError = true
                                self?.error = UserError.failedToDecode
                            }
                        }
                        self?.isRefreshing = false
                    }
                    
                }.resume() // starts the tasks and executes it for you.
        }
    }
    
    /*
     Concurrency example using async and await. Above we used URLSessions to retrieve data.
     */
//    func fetchUsersNew() async {
//        let usersUrlString = "https://jsonplaceholder.typicode.com/users"
//
//        if let url = URL(string: usersUrlString) {
//
//            do {
//
//                let (data, response) = try await URLSession.shared.data(from: url)
//
//                let decoder = JSONDecoder()
    //                self.users = try decoder.decode([User](), from: data)
//
//            } catch {
//
//            }
//        }
//    }
}

/*
 Enum class that allows us to customize errors and give suggestions.
 */
extension UsersViewModel {
    enum UserError: LocalizedError {
        case custom(error: Error)
        case failedToDecode
        
        var errorDescription: String? {
            switch self {
            case .failedToDecode:
                return "Failed to decode response! Please check you connection..."
            case .custom(let error):
                return error.localizedDescription
                
            }
        }
    }
}
