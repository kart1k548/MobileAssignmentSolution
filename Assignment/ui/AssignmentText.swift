//
//  AssignmentText.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation
import SwiftUI

struct AssignmentText: View {
    let name: String
    var color: String?
    var price: Double?
    var description: String?

    var body: some View {
        Text(name)
            .font(.headline)
            .foregroundColor(.black)
        if let color {
            Text("Color: \(color)")
                .foregroundColor(.black)
        }
        if let price {
            Text("Price: $ \(price, specifier: "%2f")")
                .foregroundColor(.black)
        }
        if let description {
            Text("Description: \(description)")
                .foregroundColor(.black)
        }
    }
}
