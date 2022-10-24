//
//  HistoryView.swift
//  FindMeActivity
//
//  Created by Hiramani Jain on 10/23/22.

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var activityManager: ActivityManager
    private var context = CoreDataManager.shared.persistentContainer.viewContext
    
    var body: some View {
        VStack(spacing:5){
            Text("Find Me Activity")
                .lilacTitle()
            List {
                if activityHistory.count >= 2 {
                    ForEach(0...activityHistory.count-2, id:\.self) {
                        InfoCard(activityCard: activityHistory[$0])
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.98431, green: 0.9411, blue: 0.64))
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
           HistoryView().environmentObject(ActivityManager())
        HistoryView()
    }
}
