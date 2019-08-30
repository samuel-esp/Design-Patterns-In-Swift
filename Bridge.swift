//
//  Bridge.swift
//  Design Patterns
//
//  Created by Samuel Esposito on 27/08/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//
import Foundation

/*Bridge Design Pattern is a pattern that allows us to use decouple the abstraction from the implementation. It's extremely important to reduce the hierarchy of ineheritance*/

/*PRE-STEP Let's take a look to a classic implementation, we need to define 2 protocol because a person cannot swim and walk at the same time. In this we create 2 Person classes and not only one, this could be a problem because, except for that function, the classes are the same. How can we just create one class instead?*/

protocol PreSwim{
    
    func swim()
    
}

protocol PreWalk{
    
    func walk()
}

class PersonWalk: PreWalk{
    
    var name: String = ""
    
    var age: Int = 32

    func walk() {
        print("i'm walking")
    }
    
}

class PersonSwim: PreSwim{
    
    var name: String = ""

    var age: Int = 32
    
    func swim() {
        print("I'm swimming")
    }
}

/*STEP 1: Let's decouple the example showed above, we separate the move function from the person class*/

protocol Move{
    
    func move() //this protocol is the bridge between the move functionality and the person
    
}

class Swim: Move{
    
    func move(){
        print("I'm swimming")
    }
    
}

class Walk: Move{

    func move(){
        print("I'm walking")
    }
    
}

class Person: Move{
    
    var name: String = ""
    
    var age: Int = 32
    
    var movementType: Move //we implement the move protocol
    
    init(_ move: Move) {
        self.movementType = move
    }
    
    func move(){
        movementType.move()
    }
    
}

func main(){
    
    let walk = Walk()
    let swim = Swim()
    
    let john = Person(swim)
    let tom = Person(walk)
    
    john.move()
    tom.move()
    
    tom.movementType = swim
    tom.move()
    
 
    
}

main()
