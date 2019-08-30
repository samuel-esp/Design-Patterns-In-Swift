//
//  Adapter.swift
//  Design Patterns
//
//  Created by Samuel Esposito on 27/08/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//
import Foundation

/*Adapter Design Pattern is a pattern that allows us to use the interface of a class as the interface of another class*/

/* STEP 1: we have a plane class for a war-game, the plane is designed to bomb a particular position of the city*/

class Plane{
    
    func Bomb(){
        print("i'm bombing the position")
    }
    
    func flying(){
        print("i'm flying to the next target!")
    }
    
}

/* STEP 2: the game is working fine but it's boring since you can only play with planes, at this point we decide to expand our game decide implementing some ground army to have ground battles as well*/

protocol Attaccker{
    
    func fire()
    
    func advance()
    
}

class Soldier: Attaccker{
    
    func fire() {
        print("i'm firing my gun")
    }
    
    func advance(){
        print("i'm taking the next position!")
    }
    
}

class Sniper: Attaccker{
    
    func fire() {
        print("I'm firing my rifle")
    }
    
    func advance(){
        print("I'm going to find another hidden spot")
    }
}
    
/*STEP 3: Cool! Now we have a better game, but reading back the code we notice how the soldier, the sniper and the plane classes perform similiar tasks. We could adapt the plane using the common interface we used for the ground army. In this way we can achieve a better looking code since every class implements the same interface with the same function names*/
 
class PlaneAdapter: Attaccker{
    
    private let plane = Plane()
    
    func fire() {
        plane.Bomb()
    }
    
    func advance(){
        plane.flying()
    }
 
}
    
/*STEP 4: Let's try everything on our main*/

func main(){
    
    let sniper = Sniper()
    
    let plane = Plane()
    let planeAdapted = PlaneAdapter()
    
    //even thoug the plane and the planeAdapted have different functions name, they perform the same task
    
    sniper.fire()
    
    plane.Bomb()
    planeAdapted.fire() //this is better looking and less confusing since it uses the same interface of the sniper but implements the function originally created by the plane
    
    
}

main()
