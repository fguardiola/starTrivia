//
//  ViewController.swift
//  StarTrivia
//
//  Created by 67621177 on 14/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLb: UILabel!
    @IBOutlet weak var hairColorLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    let personApi = PersonApi()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    func setUpView(){
        self.nameLbl.text = ""
        self.heightLbl.text = ""
        self.massLb.text = ""
        self.hairColorLbl.text = ""
        self.birthYearLbl.text = ""
        self.genderLbl.text = ""
    }
    @IBAction func randomBtnPressed(_ sender: Any) {
        //random number between 1 and 87
        personApi.getRandomPersonAlamoCodable { (person) in
            guard let person = person else{ return }
               print(person.name)
//            UIView.animate(withDuration: 1, animations: {
                self.nameLbl.text = person.name
                self.heightLbl.text = person.height
                self.massLb.text = person.mass
                self.hairColorLbl.text = person.hairColor
                self.birthYearLbl.text = person.birthYear
                self.genderLbl.text = person.gender
            
//            })
            
        }
    }
}

