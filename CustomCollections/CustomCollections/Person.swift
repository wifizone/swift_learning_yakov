//
//  Person.swift
//  CustomCollections
//
//  Created by Полуянов Яков on 03.10.2023.
//

import Foundation

public class Person {
    var name:String
    var age:Int
    var gender:String
    var description:String {
        return "Имя: \(name) Возраст: \(age) Пол: \(gender)"
    }
    
    init(name:String, age:Int, gender:String) {
        self.name = name
        self.age = age
        self.gender = gender
    }
}
extension Person: Hashable {
    public static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == lhs.age && lhs.gender == rhs.gender
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }
}

/*public class PointHashTable<T:Hashable> {
    var key:Int
    var data:T
    var description:String {
        return data as! String
    }
    init(data:T) {
        self.data = data
        key = data.hashValue
    }
}*/
