//
//  LandmarkRow.swift
//  HelloWorldIOSApp
//
//  Created by leonine on 2024/4/9.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .aspectRatio(contentMode:.fill)
                .frame(width:50,height: 50)
            Text(landmark.name)
            
            Spacer()
        }
    }
}

#Preview("Turtle Rock") {
    LandmarkRow(landmark:landmarks[0])
}

#Preview("Salmon") {
    LandmarkRow(landmark: landmarks[1])
}
