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
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(projectListViewModel.projectCellViewModels) { projectDetailViewModel in
                        NavigationLink(destination: ProjectDetailView(projectDetailViewModel: projectDetailViewModel)) {
                            ProjectCellView(projectDetailViewModel: projectDetailViewModel)
                        }
                    }
                }
            }
            .navigationBarTitle("Project Manager", displayMode: .inline)
            .navigationBarItems(trailing: addButton)
            .sheet(isPresented: $showAddProjectView) {
                ProjectAddView()
            }
        }
    }
    
    var addButton: some View {
        Button("Add") {
            self.showAddProjectView.toggle()
        }
    }
    
}




struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
