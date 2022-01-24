//
//  CDCRUDMVVMApp.swift
//  Shared
//
//  Created by Vincent Cloutier on 2022-01-24.
//

import SwiftUI

@main
struct CD_CRUD_MVVMApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var taskListViewModel = TaskListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(taskListViewModel)
        }
    }
}
