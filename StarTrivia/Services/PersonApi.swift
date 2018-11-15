//
//  PersonApi.swift
//  StarTrivia
//
//  Created by 67621177 on 14/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


class PersonApi {
    // with alamofire & codable
    func getRandomPersonAlamoCodable( completion:@escaping PersonResponseCompletion){
        
        let random  = Int.random(in: 1...87)
        let path =  GET_PERSON_URL + "\(random)"
        //create URL
        guard let url = URL(string: path) else { return }
        //create task
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error as Any)
                completion(nil)
                return
            }
            guard let data =  response.data else {
                completion(nil)
                return
            }
            let jsonDecoder = JSONDecoder()
            do{
                let person = try jsonDecoder.decode(Person.self, from: data)
                completion(person)
            }catch{
                completion(nil)
            }
        }
        
    }
    // with alamofire & swifty
    func getRandomPersonAlamoSwifty( completion:@escaping PersonResponseCompletion){
        
        let random  = Int.random(in: 1...87)
        let path =  GET_PERSON_URL + "\(random)"
        //create URL
        guard let url = URL(string: path) else { return }
        //create task
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error as Any)
                completion(nil)
                return
            }
            guard let data =  response.data else {
                completion(nil)
                return
            }
            
            do{
                let json = try JSON(data: data)
                let person = self.parsePesonSwifty(json: json)
                completion(person)
            }catch{
                completion(nil)
            }
        }
        
    }
    // with alamofire
    func getRandomPersonAlamo( completion:@escaping PersonResponseCompletion){
        
        let random  = Int.random(in: 1...87)
        let path =  GET_PERSON_URL + "\(random)"
        //create URL
        guard let url = URL(string: path) else { return }
        //create task
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error as Any)
                completion(nil)
                return
            }
            guard let json =  response.result.value as? [String:Any] else {
                completion(nil)
                return
            }
            
            let person = self.parsePesonManually(json: json)
            completion(person)
        }
        
    }
    //with URL Session
    func getRandomPersonUrlSession( completion:@escaping PersonResponseCompletion){
        //random number
//        let random  = arc4random_uniform(87)
        
        //new way
        let random  = Int.random(in: 1...87)
        let path =  GET_PERSON_URL + "\(random)"
        print(path)
        //create URL
        guard let url = URL(string: path) else { return }
        //create task
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else{
                //we have an error
                debugPrint(error.debugDescription)
                completion(nil)
                return
            }
            
            guard let data = data else { return }
            
            //parse data. Can throw an error
            do{
                let jsonArray = try JSONSerialization.jsonObject(with: data, options: [])
                //convert it in dictionary
                guard let json = jsonArray as? [ String: Any] else { return }
                let person = self.parsePesonManually(json: json)
                //this happen in the bg thread. Have it back to main
                DispatchQueue.main.async {
                    completion(person)
                }
            }catch{
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
        }
        task.resume()
        
    }
    
    func parsePesonSwifty(json:JSON) -> Person{
        
        let name = json["name"].stringValue
        let height = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hairColor = json["hair_color"].stringValue
        let birthYear = json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeworldUrl = json["homeworld"].stringValue
        let filmUrls = json["films"].arrayValue.map({$0.stringValue})
        let vehicleUrls = json["vehicles"].arrayValue.map({$0.stringValue})
        let starshipUrl = json["starships"].arrayValue.map({$0.stringValue})
        
        
        let person = Person(name: name, height: height, mass: mass, hairColor: hairColor, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrl: starshipUrl)
        
        return person
    }
    
    func parsePesonManually(json:[String:Any]) -> Person{
        
        let name = json["name"] as? String ?? ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hairColor = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeworldUrl = json["homeworld"] as? String ?? ""
        let filmUrls = json["films"] as? [String] ?? []
        let vehicleUrls = json["vehicles"] as? [String] ?? []
        let starshipUrl = json["starships"] as? [String] ?? []
        
        
        let person = Person(name: name, height: height, mass: mass, hairColor: hairColor, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrl: starshipUrl)
        
        return person
    }
}
