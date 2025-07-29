//
//  SimpleListView.swift
//  MVx
//
//  Created by Aleksandr Zhazhoyan on 28.07.2025.
//

import SwiftUI

struct SimpleListView: View {
    let title: String
    
    var body: some View {
        List(0..<20) { index in
            Text("\(title) Item \(index + 1)")
        }
    }
}
