//
//  InfoCard.swift
//  FindMeActivity
//
//  Created by Hiramani Jain on 10/23/22.
//

import SwiftUI

struct InfoCard: View {
    let activityCard: MetaData
    var body: some View {
        VStack{
            HStack {
                Text("Activity:")
                Spacer()
                Text(activityCard.activity)
                    .font(.title3)
            }
            HStack {
                Text("Type:")
                Spacer()
                Text(activityCard.type)
                    .font(.title3)
            }
            HStack {
                Text("Participants:")
                Spacer()
                Text(String(activityCard.participants))
                    .font(.title3)
            }
            HStack {
                Text("Price:")
                Spacer()
                Text(String(activityCard.price))
                    .font(.title3)
            }
            HStack {
                Text("Link:")
                Spacer()
                Text(activityCard.link)
                    .font(.title3)
            }
            HStack {
                Text("Accessibility:")
                Spacer()
                Text(String(activityCard.accessibility))
                    .font(.title3)
            }
        }
        .padding()
        .background(Color(red: 0.98431, green: 0.9411, blue: 0.64))
        .cornerRadius(30)
        .shadow(radius: 10)
    }
}

struct InfoCard_Previews: PreviewProvider {
    static var activityCard = MetaData.sampleData[0]
    static var previews: some View {
        InfoCard(activityCard: activityCard)
        .background(.gray)
        .previewLayout(.fixed(width:400,height:200))
    }
}
