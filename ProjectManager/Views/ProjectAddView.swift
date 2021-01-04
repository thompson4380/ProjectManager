//
//  ProjectAddView.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 04.01.21.
//

import SwiftUI

struct ProjectAddView: View {
  
    @State private var project = Project(id: nil, projectName: "", projectManager: "")
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Project Name", text: $project.projectName)
                TextField("Project Manager", text: $project.projectManager)
            }
            .navigationBarTitle("Add new project", displayMode: .inline)
                .navigationBarItems(leading: cancelButton, trailing: saveButton)
        }
    }
    
    var cancelButton: some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var saveButton: some View {
        // TODO: Only permit saving when all fields are valid
        Button("Save") {
            let projectDetailViewModel = ProjectDetailViewModel(project: project)
            projectDetailViewModel.addProjectToDatabase()
            presentationMode.wrappedValue.dismiss()
        }
    }
    
}

struct ProjectAddView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectAddView()
    }
}
