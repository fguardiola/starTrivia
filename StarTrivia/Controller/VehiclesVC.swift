//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by 67621177 on 16/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController,PersonNeeded {
    var person : Person!
    var selectedVehicleIndex: Int = 0
    var vehicles: [String] = [String]()
    let api = VehiclesApi()
    
    //outlets
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var modelLbl: UILabel!
    
    @IBOutlet weak var manufacturerLbl: UILabel!
    
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var maxSpeedLbl: UILabel!
    
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    
    @IBOutlet weak var previousBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    override func viewDidLoad() {
        
        nextBtn.isEnabled = false;
        previousBtn.isEnabled = false;
        
        super.viewDidLoad()
 print(person.name)
        vehicles = person.vehicleUrls
        let firstVehicleUrl =  vehicles[0]
        self.selectedVehicleIndex = 0
        self.getVehicle(url: firstVehicleUrl)
//        api.getVehicles(url: firstVehicleUrl) { (vehicle) in
//            guard let vehicle = vehicle else { return }
//
//            self.updateUI(vehicle: vehicle)
//        }
        if(vehicles.count > 1){
            nextBtn.isEnabled = true;
        }
    }
    func updateUI(vehicle: Vehicle){
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        manufacturerLbl.text = vehicle.manufacturer
        costLbl.text = vehicle.cost
        maxSpeedLbl.text = vehicle.length
        crewLbl.text = vehicle.crew
        passengersLbl.text = vehicle.passengers
        
    }

    @IBAction func previousBtnPressed(_ sender: Any) {
        //check there is another vehicle to display
//        let previousIndex = selectedVehicleIndex - 1;
//        if (previousIndex >= 0 ){
//            selectedVehicleIndex = previousIndex
////            checkPrevious(index: previousIndex)
//            api.getVehicles(url: vehicles[previousIndex]) { (vehicle) in
//                guard let vehicle = vehicle else { return }
//                self.updateUI(vehicle: vehicle)
//            }
//        }
//         checkNextPrevious(index: selectedVehicleIndex)
        
        //refactor. Next button enable unless is last element
        selectedVehicleIndex -= 1
        self.getVehicle(url: vehicles[selectedVehicleIndex])
        setButtonsState()
        
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        //check there is another vehicle to display
//        let nextIndex = selectedVehicleIndex + 1;
//        if (nextIndex <= (vehicles.count - 1) ){
//            selectedVehicleIndex = nextIndex
////            checkNext(index: nextIndex)
//            api.getVehicles(url: vehicles[nextIndex]) { (vehicle) in
//                guard let vehicle = vehicle else { return }
//                self.updateUI(vehicle: vehicle)
//            }
//        }
//        checkNextPrevious(index: selectedVehicleIndex)
        selectedVehicleIndex += 1
        self.getVehicle(url: vehicles[selectedVehicleIndex])
    }
    func setButtonsState(){
        nextBtn.isEnabled = selectedVehicleIndex == vehicles.count - 1 ? false : true
        previousBtn.isEnabled = selectedVehicleIndex == 0 ? false : true
        
        
    }
    
    func getVehicle(url:String){
        nextBtn.isEnabled = false
        previousBtn.isEnabled = false
        api.getVehicles(url: url) { (vehicle) in
            guard let vehicle = vehicle else { return }
            self.updateUI(vehicle: vehicle)
            self.setButtonsState()
        }
    }
    
//    func checkNext(index: Int){
//        let nextIndex = index + 1
//        if nextIndex < (vehicles.count - 1){
//            //enable next button
//            nextBtn.isEnabled = true;
//            return
//        }
//         nextBtn.isEnabled = false;
//    }
//
//
//    func checkPrevious(index: Int){
//        let previousIndex = index - 1
//        if previousIndex > 0{
//            //enable next button
//            previousBtn.isEnabled = true;
//            return
//        }
//        previousBtn.isEnabled = false;
//    }
//
//    func checkNextPrevious(index:Int){
//        let nextIndex = index + 1
//        let previousIndex = index - 1
//
//        nextBtn.isEnabled = false
//        previousBtn.isEnabled = false
//
//        if (nextIndex <= vehicles.count - 1 ){
//            nextBtn.isEnabled = true
//        }
//        if previousIndex >= 0 {
//            previousBtn.isEnabled = true
//        }
//    }
}
