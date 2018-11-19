//
//  VehiclesApi.swift
//  StarTrivia
//
//  Created by 67621177 on 19/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class VehiclesApi {
    func getVehicles(url: String, completion: @escaping vehicleResponseCompletion){
        guard let url = URL(string: url) else { return }
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error{
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return }
            
            let jsonDecoder = JSONDecoder()
            
            do{
                let vehicle = try jsonDecoder.decode(Vehicle.self, from: data)
                completion(vehicle)
            }catch{
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
        }
        
    }
}
