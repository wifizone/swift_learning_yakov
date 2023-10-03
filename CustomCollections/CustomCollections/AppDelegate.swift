//
//  AppDelegate.swift
//  CustomCollections
//
//  Created by Полуянов Яков on 03.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let list1 = DoublyLinkedList(element: 19)
        list1.add(element: 30)
        list1.show()
        print("Длина: \(list1.size)")
        
        print("\nпроверка удаления первого элемента")
        list1.delete(element:list1.beginning ?? PointList(data: 100)) //проверка удаления первого элемента
        list1.show()
        print("Длина: \(list1.size)")
        
        print("\nпроверка удаления последнего элемента")
        list1.add(element: 40)
        list1.delete(element:list1.end ?? PointList(data: 100)) //проверка удаления последнего элемента
        list1.show()
        print("Длина: \(list1.size)")
        
        print("\nпроверка удаления единственного элемента")
        list1.delete(element:list1.end ?? PointList(data: 100)) //проверка удаления единственного элемента
        list1.show()
        print("Длина: \(list1.size)")
        
        print("\nпроверка удаления элемента в середине списка")
        list1.add(element: 34)
        list1.add(element: 76)
        list1.add(element: 453)
        list1.delete(element:list1.end?.previous ?? PointList(data: 100)) //проверка удаления элемента в середине списка
        list1.show()
        print("Длина: \(list1.size)")
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

