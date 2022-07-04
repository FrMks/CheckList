//
//  ChecklistViewModel.swift
//  Checklist
//
//  Created by Максим Французов on 21.10.2021.
//

import SwiftUI

class ChecklistViewModel: ObservableObject {
    
    var filterDate: Date? = nil {
        willSet {
            getTasks()
        }
    }
    
    @Published var userTasks = [Task]()
    let tasksKey: String = "task_list"
    
    var tagRepository = TagRepository()
    
    
    
    init() {
        getTasks()
    }
    init(userTasks: [Task]) {
        self.userTasks = userTasks
    }
    
    func getFilterTasks() -> [Task] {
        print("getFilterT")
        return userTasks.filter {
            if let date2 = filterDate {
                let calendar = Calendar.current
                
                let year1 = calendar.component(.year, from: $0.date)
                let month1 = calendar.component(.month, from: $0.date)
                let day1 = calendar.component(.day, from: $0.date)
                
                let year2 = calendar.component(.year, from: date2)
                let month2 = calendar.component(.month, from: date2)
                let day2 = calendar.component(.day, from: date2)
                
                return year1 == year2 && month1 == month2 && day1 == day2
            }
            return true
        }
    }
    
    func addTask(taskName: String, dateUserTask: Date) {
        let tags = tagRepository.searchTagInString(taskName: taskName)
        let task = Task(id: UUID(), title: taskName, date: dateUserTask, tags: tags)
        userTasks.append(task)
        saveTasks()
    }
    
    func saveTasks() {
        print("save func")
        if let encodedData = try? JSONEncoder().encode(userTasks) {
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        }
    }
    
    func getTasks() {
        print("getTasks")
        guard
            let data = UserDefaults.standard.data(forKey: tasksKey),
            let savedTasks = try? JSONDecoder().decode([Task].self, from: data)
        else { return }
        
        self.userTasks = savedTasks
    }
    
    func deleteTask(indexSet: IndexSet) {
        print(userTasks.count)
        //userTasks.remove(atOffsets: indexSet)
        userTasks.remove(at: indexSet.first!)
        saveTasks()
        //getTasks()
        print(userTasks.count)
    }
}

struct Task: Codable, Identifiable {
    var id: UUID = UUID()
    var title: String
    var date: Date = Date()
    var tags = [Tag]()
}

class TagRepository: ObservableObject {
    
    
    
    let keyTag = "keyTag"
    
    func createNewTag(name: String) -> Tag {
        let tag = Tag(id: UUID(), name: name)
        print("CreateNewTag")
        return tag
    }
    
    func searchTagInString(taskName: String) -> [Tag] { //функция возвращает список тегов, которые были найдены, когда добавляли таску в список задач
        var foundTags = [String]()
        var index = 0
        var findTag = ""
        var isTagFound = false
        while (index < taskName.count) {
            if (taskName[index] == "#") {
                isTagFound = true
            } else if (isTagFound) {
                if (taskName[index] == " ") {
                    foundTags.append(findTag)
                    isTagFound = false
                    findTag = ""
                } else {
                    findTag += taskName[index]
                }
            }
            index += 1
        }
        if !findTag.isEmpty {
            foundTags.append(findTag)
        }
        var tagList = [Tag]()
        for tag in foundTags {
            tagList.append(findOrCreate(name: tag))
            print(tag)
        }
        return tagList
    }
    
    func searchTagInListByID() {
        
    }
    
    func deleteTagInListByID() {
        
    }
    
    func takeListOfTags() {
        
    }
    
    func findTagByName(name: String) -> Tag? { //найти тег в списке тегов
        let tags = getTags()
        for tag in tags {
            if (tag.name == name) {
                return tag
            }
        }
        return nil
    }
    
    func findOrCreate(name: String) -> Tag {
        var tag = findTagByName(name: name)
        if (tag != nil) {
            return tag!
        } else {
            tag = Tag(id: UUID(), name: name)
            saveTag(tag: tag!)
            return tag!
        }
    }
    
    func saveTag(tag: Tag) {
        var tagList = getTags()
        tagList.append(tag)
        saveTags(tagList: tagList)
    }
    
    func saveTags(tagList: [Tag]) {
        print("save Tag func")
        if let encodedTag = try? JSONEncoder().encode(tagList) {
            UserDefaults.standard.set(encodedTag, forKey: keyTag)
        }
    }
    func getTags() -> [Tag] {
        print("getTags")
        guard
            let data = UserDefaults.standard.data(forKey: keyTag),
            let savedTags = try? JSONDecoder().decode([Tag].self, from: data)
        else { return [Tag]() }
        return savedTags
    }
}

struct Tag: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String = ""
}

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}




