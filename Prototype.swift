//
//  Prototype.swift
//  Design Patterns
//
//  Created by Samuel Esposito on 27/08/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import Foundation

/*Prototype design pattern is used to create a clones from existing objects, the clone and the original objects won't have a reference relationship between each other*/

/* STEP 1: define a Cloneable protocol and instantiate an initializers that will allow us to copy */

protocol Cloneable{
    init(copyFrom target: Self)
}

/* STEP 2: our class will inherit from our protocol, the required init will be the clone function */

class Car: Cloneable{
    
    var company: String
    var model: String
    
    init(company: String, model: String) {
        self.company = company
        self.model = model
    }
    
    required init(copyFrom other: Car) {
        self.company = other.company
        self.model = other.model
    }

}

func main(){
    
let i8cabrio = Car(company: "BMW", model: "i8 Cabrio")
let series4 = Car(copyFrom: i8cabrio)
    
print(i8cabrio.model)
print(series4.model)
    
series4.model = "series 4"
    
print(i8cabrio.model)
print(series4.model)
    
}

main()
