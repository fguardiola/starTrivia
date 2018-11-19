//
//  FadeEnableBtn.swift
//  StarTrivia
//
//  Created by 67621177 on 16/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import Foundation
import UIKit

class FadeEnableBtn: UIButton {
    
    override var isEnabled: Bool{
        didSet{
            if isEnabled{
                //fade with animations
                UIView.animate(withDuration: 0.3) {
                   self.alpha = 1.0
                }
               
            }else{
                UIView.animate(withDuration: 0.3) {
                    self.alpha = 0.5
                }
            }
        }
    }
}
