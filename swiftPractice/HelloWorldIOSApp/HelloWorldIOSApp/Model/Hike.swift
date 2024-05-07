//
//  Hike.swift
//  HelloWorldIOSApp
//
//  Created by leonine on 2024/5/7.
//

import Foundation

struct Hike:Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]
    
    static var formatter = LengthFormatter()
    
    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observation:Codable, Hashable{
        var distanceFromStart: Double
        var elevavtion: Range<Double>
        var pace: Range<Double>
        var heartRage: Range<Double>
    }
}
