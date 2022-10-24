//
//  Extensions.swift
//  FindMeActivity
//
//  Created by Hiramani Jain on 10/23/22.
//

import Foundation
import SwiftUI

extension Text{
    func lilacTitle() -> some View{
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
