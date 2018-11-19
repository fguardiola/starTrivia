//
//  Constants.swift
//  StarTrivia
//
//  Created by 67621177 on 14/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import Foundation
import UIKit


let BLACK_COLOR = UIColor.black.withAlphaComponent(0.6).cgColor

//URLS

let BASE_URL = "https://swapi.co/api/"

let GET_PERSON_URL = BASE_URL + "people/"
let GET_LUKE_URL = BASE_URL + "people/1/"
typealias PersonResponseCompletion = (Person?) -> ()
typealias homeWorldResponseCompletion = (HomeWorld?) -> ()
typealias vehicleResponseCompletion = (Vehicle?) -> ()
typealias starshipResponseCompletion = (Starship?) -> ()
