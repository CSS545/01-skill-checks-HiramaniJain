//
//  DetalView.swift
//  State Managment
//
//  Created by Heeral Jain on 11/6/22.
//

import SwiftUI

struct DetailView: View {
    let url: String?
        
        var body: some View {
            WebView(urlString: url)
        }
}
