//
//  ReadJsonData.swift
//  ARBeacon
//
//  Created by Seth Erickson on 12/6/21.
//

import Foundation

//class ReadData: ObservableObject {
//    @Published var tasks = [TaskObject]()
//
//    init() {
//        loadData()
//        sortByTaskOrder()
//
//    func loadData() {
//
//        if let taskURL = Bundle.main.url(forResource: "tasks", withExtension: "json") {
//            do {
//                let taskData = try Data(contentsOf: taskURL)
//                let decoder = JSONDecoder()
//                let tasksFromJson = try decoder.decode([TaskObject].self, from: taskData)
//                //load data
//                self.tasks = tasksFromJson
//            } catch {
//                print(error)
//            }
//        }
//    }
//
//    func sortByTaskOrder() {
//        self.tasks = self.tasks.sorted(by: {$0.taskOrderNumber < $1.taskOrderNumber})
//    }
//}

class ReadData: ObservableObject  {
    @Published var tasks = [TaskObject]()

    init(){
        loadData()
    }

    func loadData()  {
        guard let url = Bundle.main.url(forResource: "tasks", withExtension: "json")
            else {
                print("Json file not found")
                return
            }

        let data = try? Data(contentsOf: url)
        let tasks = try? JSONDecoder().decode([TaskObject].self, from: data!)
        self.tasks = tasks!
    }
}



//class ReadData: ObservableObject  {
//    @Published var tasks = [TaskObject]()
//
//
//    init(){
//        print(tasks)
//        readFile()
//    }
//
//    func readFile() {
//        guard let url = Bundle.main.url(forResource: "test", withExtension: "json")
//            else {
//                print("File not found")
//                return
//            }
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: url) { (data, response, error) in
//
//            let data = try? Data(contentsOf: url)
//            let decoder = JSONDecoder()
//
//            do {
//                let jsonData = try decoder.decode([TaskObject].self, from: data!)
//                    print(jsonData)
//                    print("Hello!")
//            } catch {
//                print("Error parsing JSON data")
//            }
//        }
//    }
//}


