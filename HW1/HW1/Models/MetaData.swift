//
//  MetaData.swift
//  HW1
//
//  Created by Heeral Jain on 10/9/22.
//

import Foundation

struct MetaData: Decodable{
    
    var activity: String
    var type: String
    var participants: Int
}

var metadata:MetaData = MetaData(activity: "", type: "", participants: 0)
