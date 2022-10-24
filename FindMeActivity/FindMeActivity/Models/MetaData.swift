//
//  MetaData.swift
//  FindMeActivity
//
//  Created by Hiramani Jain on 10/23/22.
//

import Foundation

struct MetaData: Decodable{
    
    var activity: String
    var type: String
    var participants: Int
    var price: Double
    var link: String
    var key: String
    var accessibility: Double
}

var activityHistory:[MetaData] = []

extension MetaData {
    static let sampleData:[MetaData] =
    [
        MetaData(activity: "activity1", type: "type1", participants: 1, price: 1, link: "link1", key: "key1", accessibility: 1),
        MetaData(activity: "activity1", type: "type1", participants: 1, price: 1, link: "link1", key: "key1", accessibility: 1),
        MetaData(activity: "activity1", type: "type1", participants: 1, price: 1, link: "link1", key: "key1", accessibility: 1),
        MetaData(activity: "activity1", type: "type1", participants: 1, price: 1, link: "link1", key: "key1", accessibility: 1),
        MetaData(activity: "activity1", type: "type1", participants: 1, price: 1, link: "link1", key: "key1", accessibility: 1)
    ]
}


