//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by 67621177 on 16/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController,PersonNeeded {
      var person : Person!
      var starships: [String] = [String]()
      var currentIndex: Int = 0
      let api = StarshipApi()
    
    //outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengerLbl: UILabel!
    @IBOutlet weak var classLbl: UILabel!

    @IBOutlet weak var previousBtn: FadeEnableBtn!
    @IBOutlet weak var nextBtn: FadeEnableBtn!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // print(person.name)
        
        starships = person.starshipUrl
        if starships.count > 1{
            nextBtn.isEnabled = true
        }
        previousBtn.isEnabled = false
        
        guard let firstStarship = starships.first else { return }
        currentIndex = 0
        //Labels
        nameLbl.text = "--"
        modelLbl.text = "--"
        makerLbl.text = "--"
        costLbl.text = "--"
        lengthLbl.text = "--"
        speedLbl.text = "--"
        crewLbl.text = "--"
        passengerLbl.text = "--"
        classLbl.text = "--"
        
        self.getStarship(url:firstStarship)
        
        
        
        
    }
    
    @IBAction func previousBtnPressed(_ sender: Any) {
        //Decrement current index & update button status
        currentIndex -= 1
        self.getStarship(url: starships[currentIndex])
    }
    @IBAction func nextBtnPressed(_ sender: Any) {
        //Increment current index & update button status
        currentIndex += 1
        self.getStarship(url: starships[currentIndex])
    }
    
    func getStarship(url:String){
        api.getStarship(url: url) { (starship) in
            if let ship = starship {
                self.updateUI(starship: ship)
            }else{
                //We got nil from cmpletion handler. We can add some feedback to user
            }
        }
    }
    func updateUI(starship: Starship){
        //update labels with new starship
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        makerLbl.text = starship.manufacturer
        costLbl.text = starship.cost
        lengthLbl.text = starship.length
        speedLbl.text = starship.maxSpeed
        crewLbl.text = starship.crew
        passengerLbl.text = starship.passengers
        classLbl.text = starship.starshipClass
        
        //update buttons
        nextBtn.isEnabled = currentIndex == starships.count - 1 ? false : true
        previousBtn.isEnabled = currentIndex == 0 ? false : true
    }
}
