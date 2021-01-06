//
//  ProjectCellViewModel.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 03.01.21.
//

import Foundation
import Combine


class ProjectDetailViewModel: ObservableObject, Identifiable {
    
    @Published var projectRepository = ProjectRepository()
    @Published var project: Project
    
    private var cancellables = Set<AnyCancellable>()
    
    init(project: Project) {
        
        self.project = project
        
        $project
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink { project in
                self.projectRepository.updateProject(project)
            }
            .store(in: &cancellables)
        
    }
    
    func addProjectToDatabase() {
        projectRepository.addProject(self.project)
    }
    
    func deleteProjectFromDatabase() {
        projectRepository.deleteProject(self.project)
    }
}
