//
//  PersonApi.swift
//  StarTrivia
//
//  Created by 67621177 on 14/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import Foundation
import UIKit


class PersonApi {
    func getRandomPersonUrlSession(){
        //create URL
        guard let url = URL(string: GET_PERSON_URL) else { return }
        //create task
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else{
                //we have an error
                debugPrint(error.debugDescription)
                return
            }
            
            guard let data = data else { return }
            
            //parse data. Can throw an error
            do{
                let jsonArray = try JSONSerialization.jsonObject(with: data, options: [])
                //convert it in dictionary
                guard let json = jsonArray as? [ String: Any] else { return }
                print(json)
            }catch{
                debugPrint(error.localizedDescription)
                return
            }
        }
        task.resume()
        
    }
}
