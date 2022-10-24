//
//  CardView.swift
//  FindMeActivity
//
//  Created by Hiramani Jain on 10/23/22.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var activityManager: ActivityManager
    var body: some View {
        VStack(spacing: 10){
            Text("New Activity Found")
                .lilacTitle()
            InfoCard(activityCard: activityManager.metadata)
        }
        
        NavigationLink {
            ActivityView()
                .environmentObject(ActivityManager())
        } label: {
            PrimaryButton(text: "Go Back")
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color(red: 0.98431, green: 0.9411, blue: 0.64))
        .navigationBarHidden(true)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .environmentObject(ActivityManager())
    }
}
