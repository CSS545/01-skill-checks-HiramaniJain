//
//  ActivityManager.swift
//  FindMeActivity
//
//  Created by Hiramani Jain on 10/23/22.
//

import Foundation
import SwiftUI

class ActivityManager: ObservableObject {
    var metadata = MetaData(activity: "",
                            type: "",
                            participants: 0,
                            price: 0,
                            link: "",
                            key: "",
                            accessibility: 0)
    
    
    init() {
        Task.init {
            await fetchActivity()
        }
    }
    
    // Asynchronous HTTP request to get the Activity with meta data
    func fetchActivity() async {
        guard let url = URL(string: "http://www.boredapi.com/api/activity") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }

            let decoder = JSONDecoder()
            // Line below allows us to convert the data from the API into the correct format in our metadata model, without running into an error from the JSONDecoder that it couldn't find a matching codingKey
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(MetaData.self, from: data)

            DispatchQueue.main.async {
                self.metadata.activity = ""
                self.metadata.link = ""
                self.metadata.price = 0
                self.metadata.participants = 0
                self.metadata.type = ""
                self.metadata.key = ""
                self.metadata.accessibility = 0
                
                // Set new values for all variables on the main thread
                self.metadata.activity = decodedData.activity
                self.metadata.link = decodedData.link
                self.metadata.price = decodedData.price
                self.metadata.participants = decodedData.participants
                self.metadata.type = decodedData.type
                self.metadata.key = decodedData.key
                self.metadata.accessibility = decodedData.accessibility
                self.saveHistory(metadata: self.metadata)
            }
        } catch {
            print("Error fetching ACTIVITY: \(error)")
        }
    }
    
    func saveHistory(metadata: MetaData) {
        // Not storing duplicate entries
        for data in activityHistory {
            if (data.key == metadata.key) {
                return
            }
        }
        activityHistory.append(metadata)
    }
}
