//
//  DoublyLinkedList.swift
//  CustomCollections
//
//  Created by Полуянов Яков on 03.10.2023.
//

import Foundation

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
        beginning = PointList(data: element)
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
