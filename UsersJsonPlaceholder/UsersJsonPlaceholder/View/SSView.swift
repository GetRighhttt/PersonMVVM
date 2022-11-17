//
//  SSView.swift
//  UsersJsonPlaceholder
//
//  Created by Stefan Bayne on 11/17/22.
//

import SwiftUI

struct SSView: View {
    /*
         Tells wether splashscreen is active or not
         */
        @State private var isActive = false
        @State private var size = 0.8
        @State private var opacity = 0.5
        @State private var isRotated = false
        
        var body: some View {
            if isActive {
                ContentView()
            } else {
                ZStack {
                    Color("green").ignoresSafeArea()
                    VStack {
                        VStack {
                            Image(systemName: "person.circle")
                                .font(.system(size: 40))
                                .foregroundColor(Color("beige"))
                        }
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.2)) {
                                self.size = 2.8
                                self.opacity = 1.0
                            }
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            withAnimation(.easeOut(duration: 1.5)) {
                                self.isActive = true
                            }
                            self.isActive = true
                        }
                    }
                }
                
            }
            
        }
}

struct SSView_Previews: PreviewProvider {
    static var previews: some View {
        SSView()
    }
}
