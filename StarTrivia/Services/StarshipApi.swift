//
//  StarshipApi.swift
//  StarTrivia
//
//  Created by 67621177 on 19/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class StarshipApi{
    func getStarship(url: String, completion: @escaping starshipResponseCompletion ){
        guard let url = URL(string: url) else { return }
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else {
                completion(nil)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do{
                let starship = try jsonDecoder.decode(Starship.self, from: data)
                completion(starship)
            }catch{
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
        
    }
}
