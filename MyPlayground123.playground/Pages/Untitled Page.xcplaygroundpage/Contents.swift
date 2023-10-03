import UIKit

protocol Listable {
    associatedtype ListData
    var size:Int {get}
    func add(element:ListData)
    func delete(element: PointList<ListData>)
    func show()
}

public class PointList<T> {
    var data:T
    var next:PointList<T>? = nil
    var previous:PointList<T>? = nil
    
    init(data:T) {
        self.data = data
    }
}

public class DoublyLinkedList<T:Comparable>: Listable {
    public typealias DataList = T
    var beginning:PointList<T>?
    var end:PointList<T>?
    var size = 1
    
    init(element:T) {
        var beginning = PointList(data: element)
        self.beginning = beginning
        end = beginning
    }
    
    func show() {
        if size == 0 {
            print("Список пуст")
        } else {
            print("Ваш список:")
            var p = beginning
            while p != nil{
                print(p?.data ?? "Empty")
                p = p?.next
            }
        }
    }
    
    func add(element:T) {
        let newElement = PointList(data: element)
        let endElement = end
        end?.next = newElement
        newElement.previous = endElement
        end = newElement
        if size == 0 {
            beginning = newElement
        }
        size+=1
    }
    
    func delete(element:PointList<T>) {
        if size == 1 { //удаление единственного элемента списка
            beginning = nil
            end = nil
        } else if element.previous == nil { //удаление первого элемента списка
            beginning = beginning?.next
            beginning?.previous = nil
        } else if element.next == nil { //удаление последнего элемента списка
            end = end?.previous
            end?.next = nil
        } else { //удаление элемента в середине списка
            element.next?.previous = element.previous
            element.previous?.next = element.next
        }
        size-=1
    }
}

//var list1 = DoublyLinkedList(element: 19)
//list1.add(element: 30)
//list1.show()
//print("Длина: \(list1.size)")
//
//print("\nпроверка удаления первого элемента")
//list1.delete(element:list1.beginning ?? PointList(data: 100)) //проверка удаления первого элемента
//list1.show()
//print("Длина: \(list1.size)")
//
//print("\nпроверка удаления последнего элемента")
//list1.add(element: 40)
//list1.delete(element:list1.end ?? PointList(data: 100)) //проверка удаления последнего элемента
//list1.show()
//print("Длина: \(list1.size)")
//
//print("\nпроверка удаления единственного элемента")
//list1.delete(element:list1.end ?? PointList(data: 100)) //проверка удаления единственного элемента
//list1.show()
//print("Длина: \(list1.size)")
//
//print("\nпроверка удаления элемента в середине списка")
//list1.add(element: 34)
//list1.add(element: 76)
//list1.add(element: 453)
//list1.delete(element:list1.end?.previous ?? PointList(data: 100)) //проверка удаления элемента в середине списка
//list1.show()
//print("Длина: \(list1.size)")

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
