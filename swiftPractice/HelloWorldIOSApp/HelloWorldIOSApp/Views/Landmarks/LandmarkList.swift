//
//  LandmarkList.swift
//  HelloWorldIOSApp
//
//  Created by leonine on 2024/4/11.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks:[Landmark]{
        modelData.landmarks.filter{ landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        Badge()
        NavigationSplitView{
            List{
                Toggle(isOn:$showFavoritesOnly){
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label:{
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default,value:filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
