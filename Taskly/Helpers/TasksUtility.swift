//
//  TasksUtility.swift
//  Taskly
//
//  Created by Mateus Rovari on 10/04/19.
//  Copyright © 2019 Mateus Rovari. All rights reserved.
//

import Foundation

class TasksUtility {
    
    private static let key = "tasks"
    
    // archive
    private static func archive(_ tasks: [[Task]]) -> Data? {
        return try? NSKeyedArchiver.archivedData(withRootObject: tasks, requiringSecureCoding: false)
    }
    
    // fetch
    static func fetch() -> [[Task]]? {
        guard let unarchivedData = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
        return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(unarchivedData) as? [[Task]] ?? [[]]
    }
    
    // save
    static func save(_ tasks: [[Task]]) {
        
        // Archive
        let archivedTasks = archive(tasks)
        
        // Set object for key
        UserDefaults.standard.set(archivedTasks, forKey: key)
        UserDefaults.standard.synchronize();
        
    }
}
