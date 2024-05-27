//
//  DeuceComponent.swift
//  Hoops
//
//  Created by Fardin Haque on 5/27/24.
//

import Foundation
import SwiftUI

struct DeuceButtons: View {
    @Binding var isYesSelected: Bool

    var body: some View {
        HStack {
            Text("Duece?")
            
            Button(action: {
                self.isYesSelected = true
            }) {
                Text("Yes")
                    .foregroundColor(isYesSelected ? .blue : .gray)
                    .frame(width: 50, height: 5)
                    .padding()
                    .background(isYesSelected ? Color.gray.opacity(0.2) : Color.clear)
                    .cornerRadius(8)
            }
            
            Button(action: {
                self.isYesSelected = false
            }) {
                Text("No")
                    .foregroundColor(!isYesSelected ? .blue : .gray)
                    .frame(width: 50, height: 5)
                    .padding()
                    .background(!isYesSelected ? Color.gray.opacity(0.2) : Color.clear)
                    .cornerRadius(8)
            }
        }
        .padding(.horizontal)
    }
}
