//
//  BMR Class.swift
//  GeMO
//
//  Created by Denise Pacheco on 11/25/23.
//

import Foundation

class BMRModel{
    var weight: Double
    var height: Double
    var age: Double
    
    init(weight: Double, height: Double, age: Double) {
        self.weight = weight
        self.height = height
        self.age = age
    }
    func bmrMale ( ) ->Double{
        return (10*weight)+(6.25*height)-(5*age)+5
    }
    func bmrFemale( ) ->Double{
        return (10*weight)+(6.25*height)-(5*age)-161
    }
}
