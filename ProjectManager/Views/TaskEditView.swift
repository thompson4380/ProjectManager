//
//  TaskEditView.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 05.01.21.
//

import SwiftUI

struct TaskEditView: View {
    
    @ObservedObject var taskDetailViewModel: TaskDetailViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var showConfirmDeleteDialog = false
    
    var body: some View {
        Form {
            TextField("Task Name", text: $taskDetailViewModel.task.taskName)
            TextField("Task Responsible", text: $taskDetailViewModel.task.taskResponsible)
            Toggle("Done", isOn: $taskDetailViewModel.task.isDone)
            DatePicker("Due date:", selection: $taskDetailViewModel.task.dueDate, displayedComponents: .date)
        }
        .navigationBarTitle(taskDetailViewModel.task.taskName, displayMode: .inline)
        .navigationBarItems(trailing: deleteButton)
    }
    
    
    var deleteButton: some View {
        Button(action: {
            self.showConfirmDeleteDialog.toggle()
        }) {
            Image(systemName: "trash")
        }
        .alert(isPresented: $showConfirmDeleteDialog) {
            Alert(
                title: Text("Delete task"),
                message: Text("Task will be deleted"),
                primaryButton: .cancel(Text("Cancel")),
                secondaryButton: .destructive(Text("Delete"), action: self.deleteTask)
            )
        }
    }
    
    func deleteTask() {
        taskDetailViewModel.deleteTaskFromDatabase()
        presentationMode.wrappedValue.dismiss()
    }
}


