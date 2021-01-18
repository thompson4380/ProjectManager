//
//  TaskAddView.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 04.01.21.
//

import SwiftUI

struct TaskAddView: View {
    
    // TODO: Cant we initialize the Task within the init()??
    @State private var task = Task(id: nil, projectId: "", taskName: "", taskComment: "", taskResponsible: "", isDone: false, dueDate: Date())
    

    
    @Environment(\.presentationMode) var presentationMode
    
    var projectId: String
    
    init(projectId: String) {
        self.projectId = projectId
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Task Name", text: $task.taskName)
                TextField("Task Responsible", text: $task.taskResponsible)
            }
            .navigationBarTitle("Add new Task", displayMode: .inline)
                .navigationBarItems(leading: cancelButton, trailing: saveButton)
        }/*.onAppear() {
            self.task.projectId = self.projectId
        }*/
    }
    
    var cancelButton: some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var saveButton: some View {
        // TODO: Only permit saving when all fields are valid
        Button("Save") {
            task.projectId = self.projectId
            let taskDetailViewModel = TaskDetailViewModel(task: task)
            print(task.taskName)
            print(task.projectId)
            taskDetailViewModel.addTaskToDatabase()
            presentationMode.wrappedValue.dismiss()
        }
    }
}


