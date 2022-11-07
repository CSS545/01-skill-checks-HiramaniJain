//
//  PostData.swift
//  State Managment
//
//  Created by Heeral Jain on 11/6/22.
//

import Foundation
struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let url: String?
}
