//
//  ProjectDetailView.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 04.01.21.
//

import SwiftUI

struct ProjectDetailView: View {
    
    @ObservedObject var projectDetailViewModel: ProjectDetailViewModel
    
    
    
    
    
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
                        
                    }
                    List {
                        Text("Task 01")
                        Text("Task 02")
                    }
                }
                

            }
        }
        
    }
    
}




//struct ProjectDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectDetailView()
//    }
//}
