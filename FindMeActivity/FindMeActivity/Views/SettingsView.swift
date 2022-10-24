//
//  SwiftUIView.swift
//  FindMeActivity
//
//  Created by Hiramani Jain on 10/23/22.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("firstName") var firstName = ""
    @AppStorage("lastName") var lastName = ""
    @AppStorage("foundActivity") var isfoundActivity = false
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Details")){
                        TextField("First Name",
                        text: $firstName)
                        TextField("Last Name",
                        text: $lastName)
                    }
                    Section(header: Text("Member Status")){
                        Toggle("found activity", isOn: $isfoundActivity)
                       
                }
            }
        }
        .navigationTitle("Personal Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
