//
//  ContentView.swift
//  State Managment
//
//  Created by Heeral Jain on 11/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstName = ""
    @State var LastName = ""
    
    @State var users = [String]()
    
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    VStack{
                        Group{
                            TextField("First Name", text: $firstName).padding(15)
                        }.background(Color.gray).clipShape(RoundedRectangle(cornerRadius: 7)).shadow(radius: 7)
                        Group{
                            TextField("Last Name", text: $LastName).padding(15)
                        }.background(Color.gray).clipShape(RoundedRectangle(cornerRadius: 7)).shadow(radius: 7)
                        Button(action: {
                            self.users.append("\(firstName) \(LastName)")
                            self.firstName = ""
                            self.LastName = ""
                        }) {
                            Group{
                                Text("Create User").foregroundColor(.white).padding(12)
                            }.background((firstName.count + LastName.count > 0) ? Color.indigo : Color.gray).clipShape(RoundedRectangle(cornerRadius: 7)).shadow(radius: 7)
                        }
                        Label("Swipe left to delete from list", systemImage: "Trash")
                    }.padding(15)
                    
                }.background(Color.blue)
                List{
                    ForEach(users, id: \.self){ users in
                        Text(users)
                    }.onDelete(perform: {IndexSet in users.remove(atOffsets: IndexSet)})
                    //                List(users, id: \.self) { users in
                    //                    Text(users)
                    //                }.onDelete(perform: {IndexSet in users.remove(atOffsets: IndexSet)})
                }.navigationBarTitle(Text("Form"))
                    .navigationBarItems(leading: HStack{
                        Text("First Name:")
                        Text(firstName).foregroundColor(.green)
                        Text("Last Name:")
                        Text(LastName).foregroundColor(.green)
                        
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
