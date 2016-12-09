//
//  CategoryStore.swift
//  ToDo
//
//  Created by Caden Cheek on 12/5/16.
//  Copyright © 2016 Interapt. All rights reserved.
//

import UIKit

class ToDoCatStore {
    static let shared = ToDoCatStore()

    fileprivate var categories: [ToDoCategory] = []
    init() {
        let filePath = archiveFilePath()
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath) {
            categories = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as! [ToDoCategory]
        } else {
            categories.append(ToDoCategory("Coding"))
            categories.append(ToDoCategory("Home"))
            categories.append(ToDoCategory("Gaming"))
            categories.append(ToDoCategory("Other"))
            save()
        }
    }

    func addCategory(_ name: String) {
        categories.append(ToDoCategory(name))
        save()
    }

    func removeCategory(_ index: Int) {
        categories.remove(at: index)
        save()
    }

    func getCategory(_ index: Int) -> String {
        return categories[index].name
    }

    func getCategoryCount() -> Int {
        return categories.count
    }

    func updateCategory(_ index: Int, _ newName: String) {
        categories[index].name = newName
        save()
    }

    func getCategories() -> [String] {
        var resultArray = [String]()
        if ((categories.count - 1) >= 0) {
            for i in 0...categories.count - 1 {
                resultArray.append(categories[i].name)
            }
        }
        return resultArray
    }

    func save() {
        NSKeyedArchiver.archiveRootObject(categories, toFile: archiveFilePath())
    }

    fileprivate func archiveFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths.first!
        let path = (documentsDirectory as NSString).appendingPathComponent("ToDoCatStore.plist")
        return path
    }
}
