//
//  ViewController.swift
//  StarTrivia
//
//  Created by 67621177 on 14/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let personApi = PersonApi()
        
        personApi.getRandomPersonUrlSession()
        
    }


}
