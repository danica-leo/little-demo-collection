//
//  Landmark.swift
//  HelloWorldIOSApp
//
//  Created by leonine on 2024/4/7.
//
//  section 1 -  Create a landmark model - start

import Foundation
import SwiftUI //Image
import CoreLocation //CLLocationCoordinate2D

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    struct Coordinates: Hashable,Codable{
        var latitude: Double
        var longitude: Double
    }
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}
