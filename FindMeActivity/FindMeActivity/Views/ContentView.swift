//
//  ContentView.swift
//  FindMeActivity
//
//  Created by Hiramani Jain on 10/23/22.
//

import SwiftUI

struct ContentView: View {
    //Instance if ActivityManager
    @StateObject var activityManager = ActivityManager()
    var body: some View {
        NavigationView {
            VStack(spacing:10){
                VStack(spacing:5){
                Text("Find Me Activity")
                        .lilacTitle()
                    Text("Are you Bored?")
                        .foregroundColor(Color("AccentColor"))
                    Image("BoredImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                            .frame(width: 250.0, height: 250.0, alignment: .center)
                    Text("This app suggests you a random activity to do.")
                        .foregroundColor(Color("AccentColor"))
                    Text("To find an intresting activity, press the button.")                        .foregroundColor(Color("AccentColor"))
                }
                NavigationLink {
                    ActivityView()
                        .environmentObject(activityManager)
                } label: {
                    PrimaryButton(text: "Let's go!")
                }
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.98431, green: 0.9411, blue: 0.64))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
