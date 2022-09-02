//
//  LandmarkList.swift
//  SwiftUIDemo
//
//  Created by sam on 2022/9/2.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly = false
    
    // 过滤
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoriteOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
            
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)","iPhone 13 Pro Max"], id: \.self) { deviceName in
            LandmarkList()
                .environmentObject(modelData)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
