//
//  ActivityViewController.swift
//  HW1
//
//  Created by Heeral Jain on 10/9/22.
//

import Foundation
import UIKit

class ActivityViewController: UIViewController {

    @IBOutlet weak var activityValue: UILabel!
    @IBOutlet weak var typeValue: UILabel!
    @IBOutlet weak var ParticipentsValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchActivity()
        self.activityValue.text = metadata.activity
        self.typeValue.text = metadata.type
        self.ParticipentsValue.text = String(metadata.participants)
    }
    
    func fetchActivity() {
        guard let url = URL(string: "http://www.boredapi.com/api/activity") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        // Using a semaphore to wait for the completion of the network operations
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: {
            data, response, error in
            if let data = data, let response = response as? HTTPURLResponse {
                if (response.statusCode == 200) {
                    do {
                        let decoder = JSONDecoder()
                        // Line below allows us to convert the data from the API into the correct format in our metadata model, without running into an error from the JSONDecoder that it couldn't find a matching codingKey
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodedData = try decoder.decode(MetaData.self, from: data)
                        // Set new values for all variables
                        metadata.activity = decodedData.activity
                        metadata.participants = decodedData.participants
                        metadata.type = decodedData.type
                    } catch {
                        print("error")
                    }
                }
            } else {
                print((error?.localizedDescription ?? "Unknown error"))
            }
            semaphore.signal()
        }).resume()
        
        semaphore.wait()
    }

}
