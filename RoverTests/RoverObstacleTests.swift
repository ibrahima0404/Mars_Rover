//
//  RoverObstacleTests.swift
//  Mars_Rover
//
//  Created by Ibrahima KH GUEYE on 21/10/2021.
//

import XCTest
@testable import Mars_Rover

final class RoverObstacleTests: XCTestCase {
    private let coordinates = Coordinates(x: 1, y: 1)
    private let detector = DetectorMock(mockProbe: true)
    
    func testRoverMustHaveADetector() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.N, detector: detector)
        
        //When
        rover.move(command: .Backward)
        
        //Then
        XCTAssertNotNil(rover.getDetector(), "Rover detector must be not nil")
    }
    
    func testRoverCanNotMoveWhenForwardAndObstacleIsDetected() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.W, detector: detector)
        
        //When
        rover.move(command: .Forward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().x, 1)
        XCTAssertEqual(rover.getCoordinates().y, 1)
    }
    
    func testRoverCanNotMoveWhenBackwardAndObstacleIsDetected() {
        //Given
        let rover = Rover(coordinates: coordinates, direction: Direction.W, detector: detector)
        
        //When
        rover.move(command: .Backward)
        
        //Then
        XCTAssertEqual(rover.getCoordinates().x, 1)
        XCTAssertEqual(rover.getCoordinates().y, 1)
    }
}
