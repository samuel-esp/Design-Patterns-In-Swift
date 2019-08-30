//
//  Composite.swift
//  Design Patterns
//
//  Created by Samuel Esposito on 27/08/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//
import Foundation

/*Composite Pattern is a pattern that allows us to group objects in a hierarchical way, working with grouped objects may be more faster in some cases*/

/* STEP 1: Design a common interface for our objects*/

protocol Cleanable{
    
    func clean(_ with: String)
    
}

/* STEP 2: create the single classes that implements the interface*/


class Glass: Cleanable{
    
    func clean(_ with: String) {
        print("the item was cleaned with \(with)")
    }
    
}

class Dish: Cleanable{
    
    func clean(_ with: String) {
        print("the item was cleaned with \(with)")
    }
    
}


/*STEP 3: create the group that implements the interface*/

class Dishwasher: Cleanable{
    
    var cleanables = [Cleanable]()
    
    func clean(_ with: String) {
        for items in cleanables{
            print("the current item was cleaned \(with)")
        }
    }
    
}

/*STEP 3: let's try on our main*/

func main(){
    
    //Example 1: we can use the clean function on single items
    
    let glass = Glass()
    let dish = Dish()
    
    dish.clean("soap") //print the single item
    glass.clean("soap") //print the single item
    
    let dishwasher = Dishwasher()
    
    //Example 2: we can group the items and use the clean function
    
    dishwasher.cleanables.append(dish)
    dishwasher.cleanables.append(glass)
    
    dishwasher.clean("soap") //print the items (2 items)
    
    //Example 3: we can group groups and use the clean function
    
    let anotherGlass = Glass()
    let anotherDish = Dish()
    
    let group = Dishwasher()
    group.cleanables.append(anotherGlass)
    group.cleanables.append(anotherDish)
    
    dishwasher.cleanables.append(group)
    
    dishwasher.clean("much more soap") //print the original items (2 items) + the group (1 items because the objects we added inside the group are counted like a single one object)
    
}

main()
