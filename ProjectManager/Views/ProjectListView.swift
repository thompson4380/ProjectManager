//
//  ProjectListView.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 03.01.21.
//

import SwiftUI

struct ProjectListView: View {
    
    @ObservedObject var projectListViewModel = ProjectListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(projectListViewModel.projectCellViewModels) { projectCellViewModel in
                        Text(projectCellViewModel.project.projectName)
                    }
                }
            }
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
