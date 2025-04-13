//
//  ParentManager.swift
//  OurApp
//
//  Created by Daisy Martinez on 4/13/25.
//

import Foundation

class Kid: Identifiable, ObservableObject, Hashable {
    var id = UUID()
    var name: String
    @Published var taskManager = TaskManager()
    
    static func == (lhs: Kid, rhs: Kid) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    init(name: String) {
        self.name = name
    }
}

class ParentManager: ObservableObject {
    @Published var kids: [Kid] = []

    // Add a new kid
    func addKid(name: String) {
            let newKid = Kid(name: name) // No need to pass id here
            kids.append(newKid)
        }

    // Delete a kid by ID
    func deleteKid(id: UUID) {
        if let index = kids.firstIndex(where: { $0.id == id }) {
            kids.remove(at: index)
        }
    }

    // Update a kid's name by ID
    func updateKidName(id: UUID, newName: String) {
        if let index = kids.firstIndex(where: { $0.id == id }) {
            kids[index].name = newName
        }
    }
    
    func addTask(to kid: Kid, task: TaskManager.Task) {
        kid.taskManager.addTask(name: task.name, points: task.points)
    }

}

