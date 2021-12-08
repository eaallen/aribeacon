//
//  TaskJSON.swift
//  ARBeacon
//
//  Created by Seth Erickson on 12/6/21.
//

import Foundation

//struct TaskObject: Codable {
//    enum TaskKeys: String, CodingKey {
//        case id = "task_id"
//        case data
//        case ar_view_id
//        case task_name
//        case task_description
//        case task_order
//        case is_completed
//        case depends_on
//        case sub_tasks
//        case sub_task_id
//        case sub_task_name
//        case sub_task_description
//        case sub_task_order_number
//        case sub_task_is_completed
//        case sub_task_depends_on
//    }
//
//    var id: String
//    var ar_view_id: String
//    var task_name: String
//    var task_description: String?
//    var task_order: Int
//    var is_completed: Int
//    var depends_on: String?
//    var sub_task_id: String
//    var sub_task_name: String
//    var sub_task_description: String?
//    var sub_task_order_number: Int
//    var sub_task_is_completed: Int
//    var sub_task_depends_on: String?
//
//    init(from decoder: Decoder) throws {
//        let jsonData = try decoder.container(keyedBy: TaskKeys.self)
//
//        let tasks = try.container.nestedContainer(keyedBy: TaskKeys.self, forKey: .tasks)
//
//        id = try response.decode(String.self, forKey: .id)
//        ar_view_id = try response.nestedContainer(String.self, forKey: .ar_view_id)
//
//    }
//}

struct TaskObject: Codable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case taskId = "task_id"
        case arViewId = "ar_view_id"
        case taskName = "task_name"
        case taskDescription = "task_description"
        case taskOrderNumber = "task_order_number"
        case isCompleted = "is_completed"
        case dependsOn = "depends_on"
        case subTasks = "sub_tasks"
}
 
    var id = UUID() //systemID
    var taskId: String = ""
    var arViewId: String = ""
    var taskName: String = ""
    var taskDescription: String?
    var taskOrderNumber: Int = 0
    var isCompleted: Int = 0
    var dependsOn: String?
    var subTasks: [SubTaskDataObject]?
}

struct SubTaskDataObject: Codable {
    enum CodingKeys: String, CodingKey {
        case subTaskId = "sub_task_id"
        case subTaskName = "sub_task_name"
        case subTaskDescription = "sub_task_description"
        case subTaskOrderNumber = "sub_task_order_number"
        case subTaskIsCompleted = "sub_task_is_completed"
        case subTaskDependsOn = "sub_task_depends_on"
    }

//    var id = UUID()
    // Note: These MUST be optional because if the subTask array is empty it will throw an ERROR!
    var subTaskId: String?
    var subTaskName: String?
    var subTaskDescription: String?
    var subTaskOrderNumber: Int?
    var subTaskIsCompleted: Int?
    var subTaskDependsOn: String?
}

// ***************************** //

//struct TaskJSON: Codable, Identifiable {
//    enum CodingKeys: String, CodingKey {
//        case taskId = "task_id"
//        case data
//    }
//
//    var id = UUID()
//    var taskId: String
//    var data: TaskDataObject
//}
//
//struct TaskDataObject: Codable {
//    enum CodingKeys: String, CodingKey {
//        case arViewId = "ar_view_id"
//        case taskName = "task_name"
//        case taskDescription = "task_description"
//        case taskOrder = "task_order"
//        case isCompleted = "is_completed"
//        case dependsOn = "depends_on"
//        case subTasks = "sub_tasks"
//    }
//
//    var arViewId: String?
//    var taskName: String?
//    var taskDescription: String?
//    var taskOrder: Int?
//    var isCompleted: Int?
//    var dependsOn: String?
//    var subTasks: [SubTaskDataObject]?
//}
//
//struct SubTaskDataObject: Codable {
//    enum CodingKeys: String, CodingKey {
//        case subTaskId = "sub_task_id"
//        case subTaskName = "sub_task_name"
//        case subTaskDescription = "sub_task_description"
//        case subTaskOrderNumber = "sub_task_order_number"
//        case isCompleted = "is_completed"
//        case dependsOn = "depends_on"
//    }
//
//    var subTaskId: String?
//    var subTaskName: String?
//    var subTaskDescription: String?
//    var subTaskOrderNumber: Int?
//    var isCompleted: Int?
//    var dependsOn: String?
//}
