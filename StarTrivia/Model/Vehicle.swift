//
//  Vehicle.swift
//  StarTrivia
//
//  Created by 67621177 on 19/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import Foundation
import UIKit


struct Vehicle: Codable {
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let length: String
    let maxSpeed: String
    let crew: String
    let passengers: String
    
    
    enum CodingKeys: String, CodingKey{
        case name
        case model
        case manufacturer
        case cost = "cost_in_credits"
        case length
        case maxSpeed = "max_atmosphering_speed"
        case crew
        case passengers
    }
}
