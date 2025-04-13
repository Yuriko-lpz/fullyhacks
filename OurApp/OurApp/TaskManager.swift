//
//  TaskManager.swift
//  OurApp
//
//  Created by Daisy Martinez on 4/13/25.
//

import Foundation

class TaskManager: ObservableObject {
    @Published var tasks: [Task] = []

    struct Task: Identifiable {
        let id: UUID
        let name: String
        let points: Int
    }
    
    // Add a new task
    func addTask(name: String, points: Int) {
        let newTask = Task(id: UUID(), name: name, points: points)
        tasks.append(newTask)
    }

    // Delete a task by ID
    func deleteTask(id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks.remove(at: index)
        }
    }
}



