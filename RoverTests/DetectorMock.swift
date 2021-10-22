//
//  DetectorMock.swift
//  Mars_Rover
//
//  Created by Ibrahima KH GUEYE on 21/10/2021.
//

@testable import Mars_Rover

struct DetectorMock: Detector {
    var mockProbe: Bool
    
    func probe() -> Bool {
        return mockProbe
    }
}
