//
//  LandmarkRow.swift
//  SwiftUIDemo
//
//  Created by sam on 2022/9/2.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.orange)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks.randomElement()!)
                .previewDisplayName("LandmarkRow")
            LandmarkRow(landmark: landmarks.randomElement()!)
                .previewDisplayName("LandmarkRow")
        }
        .previewLayout(.fixed(width: 412, height: 70))
    }
}
