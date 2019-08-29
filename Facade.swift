//
//  Singleton.swift
//  Design Patterns
//
//  Created by Samuel Esposito on 27/08/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//
import Foundation

/*Facade Patterns helps us to hide subsystem complexity. In this way the client doesn't need to know what's the complexity of what's happening in the backgroud of a task but can access this task without taking effort*/

/* STEP 1: having clear your subsystem, int this example I create a subsystem that represents a restaurant works, you have a waiter and a chef but you can expand this example further adding other members. In this case the Waiter and the Chef work together to provide a meal*/

class Waiter{
    
    func writeOrder() -> String{
        return "writing the order"
    }
    
    func bringToTheKitchen() -> String{
        return "bringing the order to the kitchen"
    }
    
    func servingTheClient() -> String{
        return "serving the meal"
    }

}

class Chef{
    
    func takingTheOrder() -> String{
        return "Order received"
    }
    
    func cookingTheMeal() -> String{
        return "cooking the order"
    }
    
    func returningToWaiter() -> String{
        return "giving the order to the waiter"
    }
}

/* STEP 2: You have a facade class: this facade class has the purpose of hiding what's happening in the background and provide to the user what he really needs: the meal*/

class Facade{
    
    let chef = Chef()
    let waiter = Waiter()
    
    init() { }
    
    //this is our function that hides the subsystem
    func orderFood(){
        waiter.writeOrder()
        waiter.bringToTheKitchen()
        chef.takingTheOrder()
        chef.cookingTheMeal()
        chef.returningToWaiter()
        waiter.servingTheClient()
    }

}

/*STEP 3: let's test everything on a main. This is a pretty simple example, subsystems are usually more complex: a starting objects can be modified by other objects through functions and so on but the patterns behind the game stay the same*/

func main(){
    
    let facade = Facade()
    facade.orderFood()
    
}

main()
