//
//  LandmarkList.swift
//  HelloWorldIOSApp
//
//  Created by leonine on 2024/4/11.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

#Preview {
    LandmarkList()
}
