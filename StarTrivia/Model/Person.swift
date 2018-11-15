//
//  Person.swift
//  StarTrivia
//
//  Created by 67621177 on 14/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import Foundation


struct Person: Codable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let birthYear: String
    let gender: String
    let homeworldUrl: String
    let filmUrls: [String]
    let vehicleUrls: [String]
    let starshipUrl: [String]
    
    //if keys of JSON dont match our names we have to ptovide a map
    
    enum CodingKeys: String, CodingKey{
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case birthYear = "birth_year"
        case gender
        case homeworldUrl = "homeworld"
        case filmUrls = "films"
        case vehicleUrls = "vehicles"
        case starshipUrl = "starships"
    }
}
