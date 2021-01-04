//
//  ProjectDetailView.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 04.01.21.
//

import SwiftUI

struct ProjectDetailView: View {
    
    @ObservedObject var projectDetailViewModel: ProjectDetailViewModel
    
    @ObservedObject var taskListViewModel: TaskListViewModel
        
    
    @State private var showTaskAddView = false
    
    init(projectDetailViewModel: ProjectDetailViewModel) {
        self.projectDetailViewModel = projectDetailViewModel
        
        taskListViewModel = TaskListViewModel(projectId: projectDetailViewModel.project.id ?? "")
    }
    
    
    
    var body: some View {
      
        VStack {
            Form {
                
                Section(header: Text("Project Header Editable")) {
                    TextField("Project Name", text: $projectDetailViewModel.project.projectName)
                    TextField("Project Manager", text: $projectDetailViewModel.project.projectManager)
                    
                }
                Section(header: Text("Statistics")) {
                    Text("Finished 2/4")
                    Text("Due Date: 23.01.2021")
                }
                
                Section(header: Text("Tasks")) {
                    Button("Add new task") {
                        self.showTaskAddView.toggle()
                    }
                    List {
                        ForEach(taskListViewModel.taskDetailViewModels) { taskDetailViewModel in
                            Text(taskDetailViewModel.task.taskName)
                        }
                    }
                }
            }
            
        }
        .sheet(isPresented: $showTaskAddView) {
            TaskAddView(projectId: projectDetailViewModel.project.id ?? "")
        }
        
    }
    
}




//struct ProjectDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectDetailView()
//    }
//}
