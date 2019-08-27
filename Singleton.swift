//
//  Singleton.swift
//  Design Patterns
//
//  Created by Samuel Esposito on 27/08/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import Foundation

/*Singleton design pattern allows us to work with only one global instance without having to worry about managing too many copies of the same object. In some cases can be also useful to use instead of global variables */

/* STEP 1: define the original class with a private init none can access and with a static let variable called shared conforming the apple documentations*/

class Person {
    
    var name: String = "Tom"
    var age: Int = 20
    var liveIn: String = "London"
    
    static let shared = Person()
    
    private init() { }
}

/*STEP 2: let's test everything on a main*/

func main(){

let tom = Person.shared

print(tom.name)
print(tom.age)

let chris = Person.shared

chris.age = 12
chris.name = "Chris"

//there only is one instance of our class, a change will effect every object who holds the reference to the shared let
    
print(chris.name)
print(chris.age)

print(tom.name)
print(tom.age)

}

main()

