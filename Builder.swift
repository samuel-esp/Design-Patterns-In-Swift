//
//  Builder.swift
//  Design Patterns
//
//  Created by Samuel Esposito on 27/08/2019.
//  Copyright © 2019 Samuel Esposito. All rights reserved.
//

import Foundation

/*Builder Design Pattern allows us to designe a flexible solution to object creation problems, the pattern lets you construct complex objects step by step helping us not to define differents init for different initialization cases*/

/* STEP 1: define the original class with a blank init*/

class Person{
    
    //personal details
    var name: String = ""
    var gender: String = ""
    
    //address details
    var city: String = ""
    var zipCode: String = ""
    
    
    init() { }
}

/* STEP 2: define the class builder for the original class*/

class PersonBuilder{
    
    var person: Person
    
    init(person: Person) {
        self.person = person
    }
    
    var personalInfo: PersonPersonalDetailsBuilder{
        return PersonPersonalDetailsBuilder(person: self.person)
    }
    
    var addressInfo: PersonAddressDetailsBuilder{
        return PersonAddressDetailsBuilder(person: self.person)
    }
    
    func build() -> Person{
        return self.person
    }
    
}

/*STEP 3: define the details builder for each detail of the original class, the builders inherit from the person builder class in order to work properly*/

class PersonPersonalDetailsBuilder: PersonBuilder{
    
    func nameIs(name: String) -> Self{
        self.person.name = name
        return self
    }
    
    func genderIs(gender: String) -> Self{
        self.person.gender = gender
        return self
    }
    
}

class PersonAddressDetailsBuilder: PersonBuilder{
    
    func cityIs(city: String) -> Self{
        self.person.city = city
        return self
    }
    
    func zipCodeIs(zipCode: String) -> Self{
        self.person.zipCode = zipCode
        return self
    }
    
}

/*STEP 4: Let's try the result on a main func*/

func main(){
    
    var person = Person()
    let personBuilder = PersonBuilder(person: person)
    
    person = personBuilder
        .personalInfo
            .nameIs(name: "Tom")
            .genderIs(gender: "Male")
        .build()
    
    print(person.name)
    print(person.gender)
    
}
