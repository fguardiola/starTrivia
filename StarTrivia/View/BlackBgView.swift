//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by 67621177 on 14/11/2018.
//  Copyright © 2018 67621177. All rights reserved.
//

import UIKit

@IBDesignable
class BlackRoundedView: UIView {
    override func awakeFromNib() {
       setUp()
    }
    override func prepareForInterfaceBuilder() {
        self.setUp()
    }
    func setUp(){
        self.layer.cornerRadius = 10
        self.layer.backgroundColor = BLACK_COLOR
    }
}

@IBDesignable
class BlackRoundedButton: UIButton {
    override func awakeFromNib() {
        setUp()
    }
    override func prepareForInterfaceBuilder() {
        self.setUp()
    }
    func setUp(){
        self.layer.cornerRadius = 10
        self.layer.backgroundColor = BLACK_COLOR
    }
}
