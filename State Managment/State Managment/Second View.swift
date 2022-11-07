//
//  SwiftUIView.swift
//  State Managment
//
//  Created by Heeral Jain on 11/6/22.
//

import SwiftUI

struct SecondView: View {
    //This invalidates a view whenever the observable object changes.
    @ObservedObject var networkManager = NetworkManager()
        
        var body: some View {
                List(networkManager.posts) { post in
                    NavigationLink(destination: DetailView(url: post.url)) {
                        HStack {
                            Text(post.title)
                        }
                    }
                .navigationBarTitle("TECHNOLOGY NEWS")
            }
            // Adds an action to perform before this view appears.
            .onAppear {
                self.networkManager.fetchData()
            }
        }
    }

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}

