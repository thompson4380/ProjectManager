//
//  ProjectListView.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 03.01.21.
//

import SwiftUI

struct ProjectListView: View {
    
    @ObservedObject var projectListViewModel = ProjectListViewModel()
    @State private var showAddProjectView = false
    @Environment(\.editMode) var editMode
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(projectListViewModel.projectCellViewModels) { projectDetailViewModel in
                        NavigationLink(destination: ProjectDetailView(projectDetailViewModel: projectDetailViewModel)) {
                            ProjectCellView(projectDetailViewModel: projectDetailViewModel)
                        }
                        // TODO: onDelete seems to work just one time
                    }.onDelete(perform: deleteProject(at:))
                }
            }
            .navigationBarTitle("Project Manager", displayMode: .inline)
            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .sheet(isPresented: $showAddProjectView) {
                ProjectAddView()
            }
        }
    }
    
    func deleteProject(at indexSet: IndexSet) {
        for index in indexSet {
            projectListViewModel.deleteProject(at: index)
        }
    }
    
    var addButton: some View {
        Button("Add") {
            self.showAddProjectView.toggle()
        }.disabled(editMode?.wrappedValue.isEditing ?? false)
    }
    
}




struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
