//
//  Task.swift
//  Composite_Pattern
//
//  Created by Vit K on 16.09.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import Foundation

protocol Tasks {
    var name : String { get }
    var subtasks : [Task] { get }
    var parent: Task? { get set }
}

class Task: Tasks {
    private(set) var name: String
    private(set) var subtasks: [Task]
    var parent: Task?
    
    internal init(name: String, subtasks : [Task]) {
        self.name = name
        self.subtasks = subtasks
    }
    
    func addSubtask(task : Task){
        task.parent = self
        subtasks.append(task)
    }
    
    func description() -> String{
        return "\(name) подзадач \(subtasks.count)"
    }
}
