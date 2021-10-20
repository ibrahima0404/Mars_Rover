//
//  Coordinates.swift
//  Mars_Rover
//
//  Created by Ibrahima KH GUEYE on 16/10/2021.
//

struct Coordinates {
    private let PlanetSize = 5
    
    var x: Int {
        didSet {
            x = x < 1 ? PlanetSize : x
        }
    }
    
    var y: Int {
        didSet {
            y = y < 1 ? PlanetSize : y
        }
    }
}
