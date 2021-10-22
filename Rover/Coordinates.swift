//
//  Coordinates.swift
//  Mars_Rover
//
//  Created by Ibrahima KH GUEYE on 16/10/2021.
//

struct Coordinates {
    private let PlanetSize = 5
    private let PlanetMinPosition = 1
    
    var x: Int {
        didSet {
            x = x < PlanetMinPosition ? PlanetSize : x > PlanetSize ? PlanetMinPosition : x
        }
    }
    
    var y: Int {
        didSet {
            y = y < PlanetMinPosition ? PlanetSize : y > PlanetSize ? PlanetMinPosition : y
        }
    }
}
