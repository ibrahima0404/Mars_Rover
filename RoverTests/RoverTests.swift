//
//  RoverTests.swift
//  Mars_Rover
//
//  Created by Ibrahima KH GUEYE on 16/10/2021.
//

import XCTest
@testable import Mars_Rover

final class RoverTests: XCTestCase {
    private let coordinates = Coordinates(x: 1, y: 1)
    
    func testRoverMustBeNotNilAfterInstantiation() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.W)
        
        //Then
        XCTAssertNotNil(rover, "Rover must be not nil")
    }
    
    func testRoverMustKeepInitialDirectionAfterIntantiation() {
        let allDirections = Direction.allCases
  
        for direction in allDirections {
            //When
            let rover = Rover(coordinates: coordinates, direction: direction)
            
            //Then
            XCTAssertEqual(rover.getDirection(), direction)
        }
    }
    
    func testRoverMustKeepInitialCoordinatesAfterIntantiation() {
        let allCoordinates = [Coordinates(x: 1, y: 2), Coordinates(x: 2, y: 3)]
        
        for coordinates in allCoordinates {
            //When
            let rover = Rover(coordinates: coordinates, direction: Direction.W)
            
            //Then
            XCTAssertEqual(rover.getCoordinates().x, coordinates.x)
            XCTAssertEqual(rover.getCoordinates().y, coordinates.y)
        }
    }
    
    func testRoverRightMustChangeDirectionToNorthWhenInitialDirectionIsWest() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.W)
        rover.move(command: .Right)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.N)
    }
    
    func testRoverLeftMustChangeDirectionToSouthWhenInitialDirectionIsWest() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.W)
        rover.move(command: .Left)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.S)
    }
    
    func testRoverRightMustChangeDirectionToWestWhenInitialDirectionIsSouth() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.S)
        rover.move(command: .Right)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.W)
    }
    
    func testRoverLeftMustChangeDirectionToEastWhenInitialDirectionIsSouth() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.S)
        rover.move(command: .Left)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.E)
    }
    
    func testRoverRightMustChangeDirectionToSouthWhenInitialDirectionIsEast() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.E)
        rover.move(command: .Right)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.S)
    }
    
    func testRoverLeftMustChangeDirectionToNorthWhenInitialDirectionIsEast() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.E)
        rover.move(command: .Left)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.N)
    }
    
    func testRoverRightMustChangeDirectionToEastWhenInitialDirectionIsNorth() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.N)
        rover.move(command: .Right)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.E)
    }
    
    func testRoverLeftMustChangeDirectionToWestWhenInitialDirectionIsNorth() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.N)
        rover.move(command: .Left)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.W)
    }
    
    func testRoverFowardMustChangeXToZeroWhenDirectionIsWest() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.W)
        rover.move(command: .Foward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().x, 0)
    }
    
    func testRoverBackwardMustChangeXToTwoWhenDirectionIsWest() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.W)
        rover.move(command: .Backward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().x, 2)
    }
    
    func testRoverFowardMustChangeXToTwoWhenDirectionIsEast() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.E)
        rover.move(command: .Foward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().x, 2)
    }
    
    func testRoverBackwardMustChangeXToZeroWhenDirectionIsEast() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.E)
        rover.move(command: .Backward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().x, 0)
    }
    
    func testRoverFowardMustChangeYToZeroWhenDirectionIsSouth() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.S)
        rover.move(command: .Foward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().y, 0)
    }
    
    func testRoverBackwardMustChangeYToTwoWhenDirectionIsSouth() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.S)
        rover.move(command: .Backward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().y, 2)
    }
    
    func testRoverFowardMustChangeYToTwoWhenDirectionIsNorth() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.N)
        rover.move(command: .Foward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().y, 2)
    }
    
    func testRoverBackwardMustChangeYToZeroWhenDirectionIsNorth() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.N)
        rover.move(command: .Backward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().y, 0)
    }
    
    func testRoverBackwardOnXAxesMustChangeXToFiveWhenPositionIsOneOne() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.E)
        rover.move(command: .Backward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().x, 5)
    }
    
    func testRoverBackwardOnYAxesMustChangeYToFiveWhenPositionIsOneOne() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.N)
        rover.move(command: .Backward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().y, 5)
    }
    
    func testRoverMustHaveADetector() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.N)
        rover.move(command: .Backward)
        
        //Then
        XCTAssertTrue((rover as Any) is Detector)
    }
}
