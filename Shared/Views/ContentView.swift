//
//  ContentView.swift
//  Shared
//
//  Created by Vincent Cloutier on 2022-01-24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var taskListVM:TaskListViewModel
    @FetchRequest(entity: TaskList.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)]) var fetchedTaskList: FetchedResults <TaskList>
    @State private var addView = false
    var body: some View {
        NavigationView {
            List {
                Section("Favorite"){
                    ForEach(fetchedTaskList.filter{$0.isFavorite == true}) { item in
                        TaskListCell(taskListItem: item)
                    }
                }
                Section("Tasks"){
                    ForEach(fetchedTaskList.filter{$0.isFavorite == false}) { item in
                        TaskListCell(taskListItem: item)
                    }
                }
                
            }
            .sheet(isPresented: $addView) {
                AddListView(addView: $addView)
            }
            .toolbar {
                Button(action: {
                    taskListVM.taskListTitle = ""
                    taskListVM.taskListItem = nil
                    addView.toggle()
                }, label: {
                    Label("Add Item",systemImage: "plus")
                })
            }
            .navigationTitle("TASKS")
        }
    }
}
