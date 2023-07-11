//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Sergei Poluboiarinov on 19.03.2023.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .modelContainer(for: ItemModel.self)
        }
    }
}
