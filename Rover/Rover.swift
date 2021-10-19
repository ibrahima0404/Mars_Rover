//
//  Rover.swift
//  Mars_Rover
//
//  Created by Ibrahima KH GUEYE on 16/10/2021.
//

struct Rover {
    private var direction: Direction
    private var coordinates: Coordinates
    
    private init(_ coordinates: Coordinates, _ direction: Direction) {
        self.direction = direction
        self.coordinates = coordinates
    }
    
    init(coordinates: Coordinates, direction: Direction) {
        self.init(coordinates, direction)
    }
    
    func getDirection() -> Direction {
        return direction
    }
    
    func getCoordinates() -> Coordinates {
        return coordinates
    }
    
    mutating func move(command: Command) {
        switch command {
        case .Foward:
            coordinates.y += 1
        case .Backward:
            coordinates.y -= 1
        case .Left:
            direction = .S
        case .Right:
            direction = .N
        }
    }
}
