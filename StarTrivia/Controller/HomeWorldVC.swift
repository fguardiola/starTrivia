//
//  HomeWorldVC.swift
//  StarTrivia
//
//  Created by 67621177 on 16/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import UIKit

class HomeWorldVC: UIViewController,PersonNeeded {
    //vars
    var person: Person!
    var homeWorld: HomeWorld!
    var homeWorldApi = HomeWorldApi()
    // IBoulets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    @IBOutlet weak var terrainLbl: UILabel!
    @IBOutlet weak var climateLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        let url = person.homeworldUrl
        
        homeWorldApi.getHomeWorld(url: url) { (homeWorld) in
            guard let planet = homeWorld else { return }
            
            self.homeWorld = planet
            self.updateUI()
        }
    }
    func setUpUI(){
        nameLbl.text = "--"
        populationLbl.text = "--"
        terrainLbl.text = "--"
        climateLbl.text = "--"
    }
    func updateUI(){
        nameLbl.text = homeWorld.name
        populationLbl.text = homeWorld.population
        terrainLbl.text = homeWorld.terrain
        climateLbl.text = homeWorld.climate
        
    }
}
