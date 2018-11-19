//
//  HomeWorldApi.swift
//  StarTrivia
//
//  Created by 67621177 on 19/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import Foundation
import Alamofire


class HomeWorldApi {
    func getHomeWorld (url:String, completion: @escaping homeWorldResponseCompletion){
        guard let url = URL(string: url) else { return }
        
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error  {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }else{
                //data & convert to Json with codable
                guard let data =  response.data else {
                    completion(nil)
                    return
                    
                }
                
                let jsonDecoder = JSONDecoder()
                do{
                    let homeWorld = try jsonDecoder.decode(HomeWorld.self, from: data)
                    completion(homeWorld)
                }catch{
                    debugPrint(error.localizedDescription)
                    completion(nil)
                }
            }
        }
        
        
    }
}
