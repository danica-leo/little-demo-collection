//
//  LandmarkList.swift
//  HelloWorldIOSApp
//
//  Created by leonine on 2024/4/11.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationSplitView{
            List(landmarks) { landmark in
                NavigationLink{
                    LandmarkDetail(landmark: landmark)
                } label:{
                    LandmarkRow(landmark: landmark)
                }
               
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
