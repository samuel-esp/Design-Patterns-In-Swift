//
//  Factory.swift
//  Design Patternshttps://github.com/samuel-esp/Design-Patterns-In-Swift
//
//  Created by Samuel Esposito on 27/08/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//
import Foundation

/*Factory design pattern allow us to be flexible and more explicit while creating objects. In certain cases having more initializers can cause confusion, that's where the factory helps: using functions that describes what we are creating help use achieving better code*/

/* STEP 1: define the original class with private initializers then create an inner class with the explicit functions that return the private init on the original class and a singleton */

class Euro{
    
    var importAvailbale: Double
    
    static let factory = EuroFactory.shared //create this line after creating the factory and its singleton
    
    private init(dollar: Double) {
        importAvailbale = dollar * 0.90
    }
    
    private init(yen: Double){
        importAvailbale = yen * 0.0085
    }
    
class EuroFactory{
    
    private init() { }
    
    static let shared = EuroFactory() //this singleton: 1) allow us to keep private the initializers in the euro class 2) make the pattern more elegant to use
    
    func createFromDollar(value: Double) -> Euro{
        return Euro(dollar: value)
    }
    
    func createFromYen(value: Double) -> Euro{
        return Euro(yen: value)
    }

}
    
}


/*STEP 2: let's test everything on a main*/

func main(){
    
    let wallet = Euro.factory.createFromDollar(value: 22.19)
    
    let anotherWallet = Euro.factory.createFromYen(value: 1173.28)

    print(wallet.importAvailbale)
    print(anotherWallet.importAvailbale)
}

main()
