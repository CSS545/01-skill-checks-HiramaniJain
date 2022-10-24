//
//  ActivityView.swift
//  FindMeActivity
//
//  Created by Hiramani Jain on 10/23/22.
//

import SwiftUI

struct ActivityView: View {
    @EnvironmentObject var activityManager: ActivityManager
    var body: some View {
        VStack(spacing: 10){
            Text("Find Me Activity")
                .lilacTitle()
            VStack {
                NavigationLink {
                    CardView()
                        .environmentObject(activityManager)
                    
                } label: {
                    PrimaryButton(text: "Activity")
                }
                Spacer()
                    .frame(height: 50)
                NavigationLink {
                    HistoryView()
                } label: {
                    PrimaryButton(text: "History")
                }
                Spacer()
                    .frame(height: 50)
                NavigationLink {
                    SettingsView()
                } label: {
                    PrimaryButton(text: "Settings")
                }
            }
        }

        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.98431, green: 0.9411, blue: 0.64))
        .navigationBarHidden(true)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
            .environmentObject(ActivityManager())
    }
}
