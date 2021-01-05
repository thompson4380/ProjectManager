//
//  TaskEditView.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 05.01.21.
//

import SwiftUI

struct TaskEditView: View {
    
    @ObservedObject var taskDetailViewModel: TaskDetailViewModel
    
    var body: some View {
        Form {
            TextField("Task Name", text: $taskDetailViewModel.task.taskName)
            TextField("Task Responsible", text: $taskDetailViewModel.task.taskResponsible)
            Toggle("Done", isOn: $taskDetailViewModel.task.isDone)
        }
        .navigationBarTitle(taskDetailViewModel.task.taskName, displayMode: .inline)
    }
}


