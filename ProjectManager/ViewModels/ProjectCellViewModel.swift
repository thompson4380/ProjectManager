//
//  ProjectCellViewModel.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 03.01.21.
//

import Foundation


class ProjectCellViewModel: ObservableObject, Identifiable {
    
    //@Published var projectRepository = ProjectRepository()
    @Published var project: Project
    
    init(project: Project) {
        self.project = project
    }
    
}
