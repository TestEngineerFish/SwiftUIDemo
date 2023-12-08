//
//  MimikkoDialog.swift
//  SwiftUIDemo
//
//  Created by 老沙 on 2023/1/5.
//

import Foundation
import SwiftUI

struct MimikkoDialog: View {
    @State var backgroundColor = Color.clear
    var body: some View {
        ZStack(alignment: Alignment.center) {
            Button("Button"){}.buttonStyle(MimikkoButtonStyle.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .scaledToFill()
        .background(backgroundColor)
        .animation(.easeIn(duration: 2), value: backgroundColor)
        .onAppear() {
            backgroundColor = Color.orange
        }
    }
}
