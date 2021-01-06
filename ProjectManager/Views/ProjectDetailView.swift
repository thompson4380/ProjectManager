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
    
    @State private var showConfirmDeleteDialog = false
    
    
    @Environment(\.presentationMode) var presentationMode
    
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
                            NavigationLink(destination: TaskEditView(taskDetailViewModel: taskDetailViewModel)) {
                                TaskCellView(taskDetailViewModel: taskDetailViewModel)
                            }
                            // TODO: .onDelete does not enable the delete swipe function
                        }.onDelete(perform: deleteTask(at:))
                    }
                }
            }
            
        }
        .sheet(isPresented: $showTaskAddView) {
            TaskAddView(projectId: projectDetailViewModel.project.id ?? "")
        }
        .navigationBarItems(trailing: deleteButton)
        
    }
    
    // .onDelete does not work??! No completion yet
    func deleteTask(at index: IndexSet) {
        
    }
    
    func deleteProject() {
        
        self.projectDetailViewModel.deleteProjectFromDatabase()
        presentationMode.wrappedValue.dismiss()
    }
    
    
    var deleteButton: some View {
        Button(action: {
            self.showConfirmDeleteDialog.toggle()
        }) {
            Image(systemName: "trash")
        }
        .alert(isPresented: $showConfirmDeleteDialog) {
            Alert(
                title: Text("Delete project"),
                message: Text("Project with all tasks will be deleted"),
                primaryButton: .cancel(Text("Cancel")),
                secondaryButton: .destructive(Text("Delete"), action: self.deleteProject)
            )
        }
    }
    
    
    
}




//struct ProjectDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectDetailView()
//    }
//}
