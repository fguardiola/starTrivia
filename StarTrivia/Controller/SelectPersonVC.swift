//
//  ViewController.swift
//  StarTrivia
//
//  Created by 67621177 on 14/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    //vars
    var person: Person!
    //outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLb: UILabel!
    @IBOutlet weak var hairColorLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    
    @IBOutlet weak var homeWorldBtn: UIButton!
    
    @IBOutlet weak var filmBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    
    let personApi = PersonApi()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDefaultsView()
    }

    func setUpDefaultsView(){
        self.nameLbl.text = "--"
        self.heightLbl.text = "--"
        self.massLb.text = "--"
        self.hairColorLbl.text = "--"
        self.birthYearLbl.text = "--"
        self.genderLbl.text = "--"
    }
    
    
    func updateView(person:Person){
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLb.text = person.mass
        hairColorLbl.text = person.hairColor
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
        //disable buttons if there is no data
        homeWorldBtn.isEnabled = !person.homeworldUrl.isEmpty
        filmBtn.isEnabled = !person.filmUrls.isEmpty
        starshipsBtn.isEnabled = !person.starshipUrl.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
        
    }
    @IBAction func randomBtnPressed(_ sender: Any) {
        //random number between 1 and 87
        personApi.getRandomPersonAlamoCodable { (person) in
          
            guard let person = person else{ return }
            self.person = person //this is the vc variable
            self.updateView(person: person)
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /* //One way of doing it
         switch segue.identifier {
         case Sege.homeWorld.rawValue:
         if let destination = segue.destination as? HomeWorldVC{
         destination.person = self.person
         }
         case Sege.vehicles.rawValue:
         if let destination = segue.destination as? VehiclesVC{
         destination.person = self.person
         }
         case Sege.starships.rawValue:
         if let destination = segue.destination as? StarshipsVC{
         destination.person = self.person
         }
         case Sege.films.rawValue:
         if let destination = segue.destination as? FilmsVC{
         destination.person = self.person
         }
         default:
         break
         }
         
         
         enum Sege: String {
         case homeWorld = "toHomeWorld"
         case vehicles = "toVehicles"
         case starships = "toStarships"
         case films = "toFilms"
         }
         
        */
        
        //Better way of doing it. Since all destination view controllers are going to use Person object,
        //We can define a protocl with a property person on it and make all VCs conform to this protocol
        
        //Now we can:
        if var destination = segue.destination as? PersonNeeded{
            destination.person = self.person
        }
        
        
    }
    
}

protocol PersonNeeded {
    var person : Person! { get set }
}
