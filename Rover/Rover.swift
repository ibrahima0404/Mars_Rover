//
//  Rover.swift
//  Mars_Rover
//
//  Created by Ibrahima KH GUEYE on 16/10/2021.
//

class Rover {
    private var direction: Direction
    private var coordinates: Coordinates
    
    private init(_ coordinates: Coordinates, _ direction: Direction) {
        self.direction = direction
        self.coordinates = coordinates
    }
    
    convenience init(coordinates: Coordinates, direction: Direction) {
        self.init(coordinates, direction)
    }
    
    func getDirection() -> Direction {
        return direction
    }
    
    func getCoordinates() -> Coordinates {
        return coordinates
    }
    
    func move(command: Command) {
        switch command {
        case .Foward:
            moveForward()
        case .Backward:
            moveBackward()
        case .Left:
            turnLeft()
        case .Right:
            turnRight()
        }
    }
    
    fileprivate func moveForward() {
        if direction == .W {
            coordinates.x -= 1
        } else if direction == .E {
            coordinates.x += 1
        } else if direction == .S {
            coordinates.y -= 1
        } else {
            coordinates.y += 1
        }
    }
    
    fileprivate func moveBackward() {
        if direction == .W {
            coordinates.x += 1
        } else if direction == .E {
            coordinates.x -= 1
        } else if direction == .S {
            coordinates.y += 1
        } else {
            coordinates.y -= 1
        }
    }
    
    fileprivate func turnLeft() {
        if direction == .S {
            direction = .E
        } else if direction == .E {
            direction = .N
        } else if direction == .N {
            direction = .W
        } else {
            direction = .S
        }
    }
    
    fileprivate func turnRight() {
        if direction == .S {
            direction = .W
        } else if direction == .E {
            direction = .S
        } else if direction == .N {
            direction = .E
        } else {
            direction = .N
        }
    }
}
