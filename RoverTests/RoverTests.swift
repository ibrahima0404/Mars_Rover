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
    let detector = DetectorMock(mockProbe: false)
    
    func testRoverMustBeNotNilAfterInstantiation() {
        //When
        let rover = Rover(coordinates: coordinates, direction: Direction.W, detector: detector)
        
        //Then
        XCTAssertNotNil(rover, "Rover must be not nil")
    }
    
    func testRoverMustKeepInitialDirectionAfterIntantiation() {
        let allDirections = Direction.allCases
        
        for direction in allDirections {
            //When
            let rover = Rover(coordinates: coordinates, direction: direction, detector: detector)
            
            //Then
            XCTAssertEqual(rover.getDirection(), direction)
        }
    }
    
    func testRoverMustKeepInitialCoordinatesAfterIntantiation() {
        //Given
        let allCoordinates = [Coordinates(x: 1, y: 2), Coordinates(x: 2, y: 3)]
        
        for coordinates in allCoordinates {
            //When
            let rover = Rover(coordinates: coordinates, direction: Direction.W, detector: detector)
            
            //Then
            XCTAssertEqual(rover.getCoordinates().x, coordinates.x)
            XCTAssertEqual(rover.getCoordinates().y, coordinates.y)
        }
    }
    
    func testRoverRightMustChangeDirectionToNorthButNotCoordinatesWhenInitialDirectionIsWest() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.W, detector: detector)
        
        //When
        rover.move(command: .Right)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.N)
        XCTAssertEqual(rover.getCoordinates().x, 1)
        XCTAssertEqual(rover.getCoordinates().y, 1)
    }
    
    func testRoverLeftMustChangeDirectionToSouthButNotCoordinatesWhenInitialDirectionIsWest() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.W, detector: detector)
        
        //When
        rover.move(command: .Left)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.S)
        XCTAssertEqual(rover.getCoordinates().x, 1)
        XCTAssertEqual(rover.getCoordinates().y, 1)
    }
    
    func testRoverBackwardMustChangeXToTwoWhenDirectionIsWest() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.W, detector: detector)
        
        //When
        rover.move(command: .Backward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().x, 2)
    }
    
    func testRoverRightMustChangeDirectionToWestButNotCoordinatesWhenInitialDirectionIsSouth() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.S, detector: detector)
        
        //When
        rover.move(command: .Right)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.W)
        XCTAssertEqual(rover.getCoordinates().x, 1)
        XCTAssertEqual(rover.getCoordinates().y, 1)
    }
    
    func testRoverLeftMustChangeDirectionToEastWhenButNotCoordinatesInitialDirectionIsSouth() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.S, detector: detector)
        
        //When
        rover.move(command: .Left)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.E)
        XCTAssertEqual(rover.getCoordinates().x, 1)
        XCTAssertEqual(rover.getCoordinates().y, 1)
    }
    
    func testRoverBackwardMustChangeYToTwoWhenDirectionIsSouth() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.S, detector: detector)
        
        //When
        rover.move(command: .Backward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().y, 2)
    }
    
    func testRoverRightMustChangeDirectionToSouthButNotCoordinatesWhenInitialDirectionIsEast() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.E, detector: detector)
        
        //When
        rover.move(command: .Right)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.S)
        XCTAssertEqual(rover.getCoordinates().x, 1)
        XCTAssertEqual(rover.getCoordinates().y, 1)
    }
    
    func testRoverLeftMustChangeDirectionToNorthWhenButNotCoordinatesInitialDirectionIsEast() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.E, detector: detector)
        
        //When
        rover.move(command: .Left)
        XCTAssertEqual(rover.getCoordinates().x, 1)
        XCTAssertEqual(rover.getCoordinates().y, 1)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.N)
    }
    
    func testRoverForwardMustChangeXToTwoWhenDirectionIsEast() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.E, detector: detector)
        
        //When
        rover.move(command: .Forward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().x, 2)
    }
    
    func testRoverRightMustChangeDirectionToEastButNotCoordinatesWhenInitialDirectionIsNorth() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.N, detector: detector)
        
        //When
        rover.move(command: .Right)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.E)
        XCTAssertEqual(rover.getCoordinates().x, 1)
        XCTAssertEqual(rover.getCoordinates().y, 1)
    }
    
    func testRoverLeftMustChangeDirectionToWestButNotCoordinatesWhenInitialDirectionIsNorth() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.N, detector: detector)
        
        //When
        rover.move(command: .Left)
        
        //Then
        XCTAssertEqual(rover.getDirection(), Direction.W)
        XCTAssertEqual(rover.getCoordinates().x, 1)
        XCTAssertEqual(rover.getCoordinates().y, 1)
    }
    
    func testRoverForwardMustChangeYToTwoWhenDirectionIsNorth() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.N, detector: detector)
        
        //When
        rover.move(command: .Forward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().y, 2)
    }
    
    func testRoverBackwardOnXAxesMustChangeXToFiveWhenPositionIsOneOne() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.E, detector: detector)
        
        //When
        rover.move(command: .Backward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().x, 5)
    }
    
    func testRoverBackwardOnYAxesMustChangeYToFiveWhenPositionIsOneOne() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.N, detector: detector)
        
        //When
        rover.move(command: .Backward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().y, 5)
    }
}
